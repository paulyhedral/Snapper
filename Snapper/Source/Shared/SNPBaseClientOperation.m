//
//  SNPBaseClientOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/23/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseClientOperation.h"

#import <Mantle/Mantle.h>
#import <libkern/OSAtomic.h>

#import "NSString+URLEncoding.h"

#import "SNPConstants.h"


@implementation SNPBaseClientOperation {

@private
    NSDateFormatter* _dateFormatter;
    dispatch_once_t _onceToken;

    NSHTTPURLResponse* _httpResponse;
    NSInteger _statusCode;

}

#pragma mark - Initializers

- (id)init {

    self = [super init];
    if(self) {
        self.method = @"GET";

        dispatch_once(&_onceToken, ^{
            _dateFormatter = [[NSDateFormatter alloc] init];
            _dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
            _dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
        });
    }

    OSMemoryBarrier();

    return self;
}

- (id)initWithFinishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [self init];
    if(self) {
        self.finishBlock = finishBlock;
    }

    return self;
}

- (id)initWithEndpoint:(NSURL*)endpoint
                method:(NSString*)method
               headers:(NSDictionary*)headers
            parameters:(NSDictionary*)parameters
                  body:(NSData*)body
              bodyType:(NSString*)bodyType
         progressBlock:(void (^)(NSInteger bytesWritten, NSInteger totalBytesWritten, NSInteger totalBytes))progressBlock
           finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [self initWithFinishBlock:finishBlock];
    if(self) {
        self.endpoint = endpoint;
        self.method = method;
        self.headers = headers;
        self.parameters = parameters;
        self.body = body;
        self.bodyType = bodyType;
        self.progressBlock = progressBlock;
    }

    return self;
}


#pragma mark - Main

- (void)main {

    // Sanity checks.
    NSAssert(_method, @"No method set for API operation!");
    NSAssert(_endpoint, @"No endpoint set for API operation!");

    _receivedData = [NSMutableData new];

    // Query parameters
    NSMutableString* queryParams = [NSMutableString new];
    [_parameters enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL* stop) {
        if([queryParams length] > 0) {
            [queryParams appendString:@"&"];
        }

        [queryParams appendFormat:@"%@=%@", [key encodedURLParameterString], [value encodedURLParameterString]];
    }];

    if([queryParams length] > 0) {
        NSString* urlString = [NSString stringWithFormat:@"%@?%@", [_endpoint absoluteString], queryParams];
        _endpoint = [NSURL URLWithString:urlString];
    }

    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:_endpoint];

    // Provided headers
    [_headers enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL* stop) {
        [request addValue:value
       forHTTPHeaderField:key];
    }];

    [request addValue:@"application/json"
   forHTTPHeaderField:@"Accept"];

    // Set request body.
    NSString* localMethod = [_method uppercaseString];
    [request setHTTPMethod:localMethod];
    if([localMethod isEqualToString:@"POST"] ||
       [localMethod isEqualToString:@"PUT"] ||
       [localMethod isEqualToString:@"DELETE"]) {
        request.HTTPBody = _body;

        if(_bodyType) {
            [request addValue:_bodyType
           forHTTPHeaderField:@"Content-Type"];
        }
    }

    _connection = [[NSURLConnection alloc] initWithRequest:request
                                                  delegate:self
                                          startImmediately:YES];

    while(!_done &&
          !self.isCancelled) {
        NSDate* futureDate = [NSDate dateWithTimeIntervalSinceNow:5];
        [[NSRunLoop currentRunLoop] runUntilDate:futureDate];
    }
}


#pragma mark - Utility methods

- (SNPResponse*)createResponseFromJSON:(NSDictionary*)jsonDict {

    SNPResponse* response = [[SNPResponse alloc] init];

    // Process metadata.
    SNPMetadata* meta = [[SNPMetadata alloc] init];

    // Status code.
    NSDictionary* metaDict = jsonDict[@"meta"];
    meta.code = [metaDict[@"code"] integerValue];

    // Error information.
    meta.errorId = metaDict[@"error_id"];
    meta.errorSlug = metaDict[@"error_slug"];
    meta.errorMessage = metaDict[@"error_message"];

    // Pagination data.
    meta.minId = [metaDict[@"min_id"] integerValue];
    meta.maxId = [metaDict[@"max_id"] integerValue];
    meta.more = [metaDict[@"more"] boolValue];

    // Stream marker data.
    NSDictionary* markerDict = metaDict[@"marker"];
    if(markerDict) {
        SNPStreamMarker* streamMarker = [[SNPStreamMarker alloc] init];

        streamMarker.postId = [markerDict[@"id"] integerValue];
        streamMarker.name = markerDict[@"name"];
        streamMarker.percentage = [markerDict[@"percentage"] integerValue];
        streamMarker.version = markerDict[@"version"];

        if(markerDict[@"updated_at"]) {
            streamMarker.updatedAt = [_dateFormatter dateFromString:markerDict[@"updated_at"]];
        }

        meta.streamMarker = streamMarker;
    }

    // Explore stream data.
    NSDictionary* exploreStreamDict = metaDict[@"explore_stream"];
    if(exploreStreamDict) {
        SNPExploreStream* exploreStream = [[SNPExploreStream alloc] init];

        exploreStream.slug = exploreStreamDict[@"slug"];
        exploreStream.title = exploreStreamDict[@"title"];
        exploreStream.exploreDescription = exploreStreamDict[@"description"];
        exploreStream.URL = [NSURL URLWithString:exploreStreamDict[@"url"]];

        meta.exploreStream = exploreStream;
    }

    // Subscription information.
    meta.subscriptionId = metaDict[@"subscription_id"];

    response.metadata = meta;

    // Process data.
    response.data = jsonDict[@"data"];

    return response;
}

- (SNPResponse*)createResponseFromError:(NSError*)error {

    SNPResponse* response = [[SNPResponse alloc] init];

    SNPMetadata* meta = [[SNPMetadata alloc] init];
    meta.errorId = [NSString stringWithFormat:@"%ld", (long)error.code];
    meta.errorMessage = [error localizedDescription];

    response.metadata = meta;

    return response;
}


#pragma mark - Connection delegate methods

- (void)connection:(NSURLConnection*)connection
willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge*)challenge {

    NSString* authMethod = challenge.protectionSpace.authenticationMethod;

    if([authMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
    }
}

- (void)connection:(NSURLConnection*)connection
   didSendBodyData:(NSInteger)bytesWritten
 totalBytesWritten:(NSInteger)totalBytesWritten
totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite {

    if(_progressBlock) {
        _progressBlock(bytesWritten, totalBytesWritten, totalBytesExpectedToWrite);
    }
}

- (void)connection:(NSURLConnection*)connection
didReceiveResponse:(NSURLResponse*)response {

    _httpResponse = (NSHTTPURLResponse*)response;
    _statusCode = _httpResponse.statusCode;

    // TODO
}

- (void)connection:(NSURLConnection*)connection
    didReceiveData:(NSData*)data {
    [_receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection*)connection {

    NSError* jsonError = nil;
    NSDictionary* jsonData = [NSJSONSerialization JSONObjectWithData:_receivedData
                                                             options:0
                                                               error:&jsonError];
    if(jsonData == nil) {
        SNPResponse* response = [self createResponseFromError:jsonError];

        if(_finishBlock) {
            _finishBlock(response);
        }
        _done = YES;
        return;
    }

    SNPResponse* response = [self createResponseFromJSON:jsonData];

    // Extract relevant headers.
    if(_httpResponse) {
        response.metadata.headers = [_httpResponse allHeaderFields];
    }

    // Process data.
    if(response.data) {
        if(_serializationBlock) {
            NSError* serializationError = nil;
            id serializedData = _serializationBlock(response.data, &serializationError);
            if(serializedData == nil &&
               serializationError) {
                response = [self createResponseFromError:serializationError];
            }
            else {
                response.data = serializedData;
            }
        }
        else if(_serializationRootClass) {
            NSError* error = nil;
            MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:response.data
                                                                          modelClass:_serializationRootClass
                                                                               error:&error];
            if(adapter == nil) {
                response = [self createResponseFromError:error];
            }
            else {
                id serializedObject = [adapter model];
                if(serializedObject == nil) {
                    NSError* error = [NSError errorWithDomain:SNP_ERROR_DOMAIN
                                                         code:SNPSerializationErrorCode
                                                     userInfo:nil];
                    response = [self createResponseFromError:error];
                }
                else {
                    response.data = serializedObject;
                }
            }
        }
        else if(_serializationArrayClass) {
            NSMutableArray* arrayOfData = [NSMutableArray new];

            for(NSDictionary* objectDict in response.data) {
                NSError* error = nil;
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:objectDict
                                                                              modelClass:_serializationArrayClass
                                                                                   error:&error];
                if(adapter == nil) {
                    response = [self createResponseFromError:error];
                }
                else {
                    id serializedObject = [adapter model];
                    if(serializedObject == nil) {
                        NSError* error = [NSError errorWithDomain:SNP_ERROR_DOMAIN
                                                             code:SNPSerializationErrorCode
                                                         userInfo:nil];
                        response = [self createResponseFromError:error];
                        arrayOfData = nil;
                        break;
                    }
                    else {
                        [arrayOfData addObject:serializedObject];
                    }
                }
            }

            response.data = arrayOfData;
        }
        else {
            NSAssert(YES, @"Cannot deserialize response data; no deserialization method is set for this operation!");
        }
    }
    
    if(_finishBlock) {
        _finishBlock(response);
    }
    
    _done = YES;
}

- (void)connection:(NSURLConnection*)connection
  didFailWithError:(NSError*)error {
    
    SNPResponse* response = [self createResponseFromError:error];
    
    if(_finishBlock) {
        _finishBlock(response);
    }
    
    _done = YES;
}

@end
