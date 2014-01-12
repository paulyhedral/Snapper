//
//  SNPPasswordLoginOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 1/10/14.
//  Copyright (c) 2014 Pilgrimage Software. All rights reserved.
//

#import "SNPPasswordLoginOperation.h"

#import "NSString+URLEncoding.h"
#import "SNPConstants.h"


@implementation SNPPasswordLoginOperation {

@private
    void (^_finishBlock)(NSString*, SNPToken*, NSError*);

    NSMutableData* _receivedData;
    NSURLConnection* _connection;
    NSInteger _statusCode;
    BOOL _done;

}

- (instancetype)initWithClientId:(NSString*)clientId
                     grantSecret:(NSString*)grantSecret
                        username:(NSString*)username
                        password:(NSString*)password
                           scope:(NSString*)scope
                     finishBlock:(void (^)(NSString*, SNPToken*, NSError*))finishBlock {

    self = [super init];
    if(self) {
        _clientId = clientId;
        _grantSecret = grantSecret;
        _username = username;
        _password = password;
        _scope = scope;
        _finishBlock = [finishBlock copy];
    }

    return self;
}

- (void)main {

    _receivedData = [NSMutableData new];

    NSURL* url = [NSURL URLWithString:@"https://account.app.net/oauth/access_token"];

    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:url];

    request.HTTPMethod = @"POST";

    [request addValue:@"application/json"
   forHTTPHeaderField:@"Accept"];
    [request addValue:@"application/x-www-form-urlencoded"
   forHTTPHeaderField:@"Content-type"];

    NSString* bodyString = [NSString stringWithFormat:@"client_id=%@&password_grant_secret=%@&grant_type=password&username=%@&password=%@&scope=%@",
                            [[_clientId encodedURLParameterString] stringByReplacingOccurrencesOfString:@" "
                                                                                             withString:@"+"],
                            [[_grantSecret encodedURLParameterString] stringByReplacingOccurrencesOfString:@" "
                                                                                                withString:@"+"],
                            [[_username encodedURLParameterString] stringByReplacingOccurrencesOfString:@" "
                                                                                             withString:@"+"],
                            [[_password encodedURLParameterString] stringByReplacingOccurrencesOfString:@" "
                                                                                             withString:@"+"],
                            [[_scope encodedURLParameterString] stringByReplacingOccurrencesOfString:@" "
                                                                                          withString:@"+"]];
    NSData* bodyData = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = bodyData;

    _connection = [[NSURLConnection alloc] initWithRequest:request
                                                  delegate:self
                                          startImmediately:YES];

    while(!_done &&
          !self.isCancelled) {
        NSDate* futureDate = [NSDate dateWithTimeIntervalSinceNow:5];
        [[NSRunLoop currentRunLoop] runUntilDate:futureDate];
    }
}


#pragma mark - URL connection delegate methods

- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data {
    [_receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response {

    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;

    _statusCode = httpResponse.statusCode;
    NSLog(@"Status code: %ld", (long)_statusCode);
}

- (void)connection:(NSURLConnection *)connection
   didSendBodyData:(NSInteger)bytesWritten
 totalBytesWritten:(NSInteger)totalBytesWritten
totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite {

}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error {

    _finishBlock(nil, nil, error);

    _done = YES;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {

    NSError* error = nil;
    NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:_receivedData
                                                                 options:0
                                                                   error:&error];
    if(responseDict == nil) {
        _finishBlock(nil, nil, error);
    }

    // check for error message
    NSString* errorMsg = responseDict[@"error"];
    if(errorMsg) {
        NSString* errorText = responseDict[@"error_text"];
        NSString* errorTitle = responseDict[@"error_title"];

        NSMutableDictionary* infoDict = [NSMutableDictionary new];
        infoDict[@"error"] = errorMsg;
        if(errorText) {
            infoDict[@"error_text"] = errorText;
        }
        if(errorTitle) {
            infoDict[@"error_title"] = errorTitle;
        }

        NSError* authError = [NSError errorWithDomain:SNP_ERROR_DOMAIN
                                                 code:_statusCode
                                             userInfo:infoDict];
        _finishBlock(nil, nil, authError);
        _done = YES;
    }

    NSString* accessToken = responseDict[@"access_token"];
    SNPToken* token = [[SNPToken alloc] initWithExternalRepresentation:responseDict[@"token"]];
    
    _finishBlock(accessToken, token, nil);
    
    _done = YES;
}

@end
