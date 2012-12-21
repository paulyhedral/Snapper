//
//  SNBaseOAuthOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNBaseOAuthOperation.h"

#import "NSString+URLEncoding.h"

#import "SNAccountManager.h"


@implementation SNBaseOAuthOperation {

@private
    void (^_finishBlock)(SNResponse* response);

    NSURLConnection* _connection;
    NSMutableData* _receivedData;
    BOOL _done;

}

#pragma mark - Initializers

- (id)initWithEndpoint:(NSURL*)endpoint
                method:(NSString*)method
               headers:(NSDictionary*)headers
            parameters:(NSDictionary*)parameters
                  body:(NSData*)body
              bodyType:(NSString*)bodyType
               accountId:(NSString*)accountId
           finishBlock:(void (^)(SNResponse* response))finishBlock {

    self = [super init];
    if(self) {
        _endpoint = [endpoint copy];
        _method = [method copy];
        _headers = [headers copy];
        _parameters = [parameters copy];
        _body = [body copy];
        _bodyType = [bodyType copy];
        _accountId = accountId;
        _finishBlock = [finishBlock copy];
    }

    return self;
}


#pragma mark - Main

- (void)main {

    NSAssert(_accountId, @"Account ID must be set before operation starts");

    SNAccount* account = [[SNAccountManager sharedAccountManager] accountForId:_accountId];
    NSAssert(account, @"No account found for ID: %@", _accountId);

    _receivedData = [NSMutableData new];

    NSString* accessToken = account.accessToken;
    if(accessToken == nil) {
        SNMetadata* meta = [[SNMetadata alloc] init];
        meta.errorMessage = [NSString stringWithFormat:NSLocalizedString(@"No access token found for account: %@", nil), account.name];
        meta.errorSlug = @"no_token";

        SNResponse* response = [[SNResponse alloc] init];
        response.metadata = meta;

        _finishBlock(response);
        return;
    }

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

    NSMutableURLRequest* signedRequest = [[NSMutableURLRequest alloc] initWithURL:_endpoint];

    // Provided headers
    [_headers enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL* stop) {
        [signedRequest addValue:value
             forHTTPHeaderField:key];
    }];

    // OAuth header
    NSString* bearerTokenValue = [NSString stringWithFormat:@"%@ %@", account.tokenType, account.accessToken];
    [signedRequest addValue:bearerTokenValue
         forHTTPHeaderField:@"Authorization"];

    [signedRequest addValue:@"application/json"
         forHTTPHeaderField:@"Accept"];

    // Set request body.
    NSString* localMethod = [_method uppercaseString];
    [signedRequest setHTTPMethod:localMethod];
    if([localMethod isEqualToString:@"POST"] ||
       [localMethod isEqualToString:@"PUT"] ||
       [localMethod isEqualToString:@"DELETE"]) {
        signedRequest.HTTPBody = _body;

        if(_bodyType) {
            [signedRequest addValue:_bodyType
                 forHTTPHeaderField:@"Content-Type"];
        }
    }

    _connection = [[NSURLConnection alloc] initWithRequest:signedRequest
                                                  delegate:self
                                          startImmediately:YES];

    while(!_done &&
          !self.isCancelled) {
        NSDate* futureDate = [NSDate dateWithTimeIntervalSinceNow:5];
        [[NSRunLoop currentRunLoop] runUntilDate:futureDate];
    }
}


#pragma mark - Worker methods

- (SNResponse*)createResponseFromJSON:(NSDictionary*)jsonData {

    SNResponse* response = [[SNResponse alloc] init];

    // Process metadata.
    SNMetadata* meta = [[SNMetadata alloc] init];

    // Status code.
    meta.code = [jsonData[@"meta"][@"code"] integerValue];

    // Error information.
    meta.errorId = jsonData[@"meta"][@"error_id"];
    meta.errorSlug = jsonData[@"meta"][@"error_slug"];
    meta.errorMessage = jsonData[@"meta"][@"error_message"];

    // Pagination data.
    meta.minId = [jsonData[@"meta"][@"min_id"] integerValue];
    meta.maxId = [jsonData[@"meta"][@"max_id"] integerValue];
    meta.more = [jsonData[@"meta"][@"more"] boolValue];

    // Stream marker data.
    NSDictionary* marker = jsonData[@"meta"][@"marker"];
    if(marker) {
        SNStreamMarker* streamMarker = [[SNStreamMarker alloc] init];

        streamMarker.postId = [marker[@"id"] integerValue];
        streamMarker.name = marker[@"name"];
        streamMarker.percentage = [marker[@"percentage"] integerValue];
        streamMarker.version = marker[@"version"];

        if(marker[@"updated_at"]) {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
            dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
            streamMarker.updatedAt = [dateFormatter dateFromString:marker[@"updated_at"]];
        }

        meta.streamMarker = streamMarker;
    }

    response.metadata = meta;

    // Process data.
    response.data = jsonData[@"data"];

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
    // TODO
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
        SNMetadata* meta = [[SNMetadata alloc] init];
        meta.code = jsonError.code;
        meta.errorMessage = [jsonError localizedDescription];

        SNResponse* response = [[SNResponse alloc] init];
        response.metadata = meta;

        _finishBlock(response);
        _done = YES;
        return;
    }

    SNResponse* response = [self createResponseFromJSON:jsonData];
    _finishBlock(response);

    _done = YES;
}

- (void)connection:(NSURLConnection*)connection
  didFailWithError:(NSError*)error {

    SNMetadata* meta = [[SNMetadata alloc] init];
    meta.code = error.code;
    meta.errorMessage = [error localizedDescription];
    
    SNResponse* response = [[SNResponse alloc] init];
    response.metadata = meta;
    
    _finishBlock(response);
    _done = YES;
}

@end
