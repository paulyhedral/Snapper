//
//  SNPBaseFileOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 1/28/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseFileOperation.h"

#import <Mantle/Mantle.h>

#import "NSString+URLEncoding.h"

#import "SNPAccountManager.h"

#import "SNPConstants.h"


@implementation SNPBaseFileOperation {

@private
NSURLConnection* _connection;
NSMutableData* _receivedData;
BOOL _done;

}

#pragma mark - Initializers

- (id)init {

    self = [super init];
    if(self) {
        self.method = @"GET";
    }

    return self;
}

- (id)initWithAccountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [self init];
    if(self) {
        self.accountId = accountId;
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
             accountId:(NSString*)accountId
         progressBlock:(void (^)(NSInteger bytesWritten, NSInteger totalBytesWritten, NSInteger totalBytes))progressBlock
           finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super init];
    if(self) {
        self.endpoint = endpoint;
        self.method = method;
        self.headers = headers;
        self.parameters = parameters;
        self.body = body;
        self.bodyType = bodyType;
        self.accountId = accountId;
        self.progressBlock = progressBlock;
        self.finishBlock = finishBlock;
    }

    return self;
}


#pragma mark - Main

- (void)main {

    // Sanity checks.
    NSAssert(_accountId, @"Account ID must be set before operation starts");

    SNPAccount* account = [[SNPAccountManager sharedAccountManager] accountForId:_accountId];
    NSAssert(account, @"No account found for ID: %@", _accountId);

    NSAssert(_method, @"No method set for API operation!");
    NSAssert(_endpoint, @"No endpoint set for API operation!");

    _receivedData = [NSMutableData new];

    NSString* accessToken = account.accessToken;
    if(accessToken == nil) {
        SNPMetadata* meta = [[SNPMetadata alloc] init];
        meta.errorMessage = [NSString stringWithFormat:NSLocalizedString(@"No access token found for account: %@", nil), account.name];
        meta.errorSlug = @"no_token";

        SNPResponse* response = [[SNPResponse alloc] init];
        response.metadata = meta;

        _finishBlock(response);
        return;
    }

    // Query parameters
    NSMutableString* queryParams = [NSMutableString new];
    // add file token if necessary
    if(_fileToken) {
        NSMutableDictionary* tempDict = [_parameters mutableCopy];
        tempDict[@"file_token"] = _fileToken;
        _parameters = [tempDict copy];
    }
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

    // OAuth header
    NSString* tokenValue = [NSString stringWithFormat:@"%@ %@", account.tokenType, account.accessToken];
    [request addValue:tokenValue
   forHTTPHeaderField:@"Authorization"];

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
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
            dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
            streamMarker.updatedAt = [dateFormatter dateFromString:markerDict[@"updated_at"]];
        }

        meta.streamMarker = streamMarker;
    }

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

    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
    NSInteger statusCode = httpResponse.statusCode;

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
            id serializedObject = [_serializationRootClass modelWithExternalRepresentation:response.data];
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
        else if(_serializationArrayClass) {
            NSMutableArray* arrayOfData = [NSMutableArray new];

            for(NSDictionary* objectDict in response.data) {
                id serializedObject = [_serializationArrayClass modelWithExternalRepresentation:response.data];
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

            response.data = arrayOfData;
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
