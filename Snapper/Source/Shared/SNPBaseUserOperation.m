//
//  SNPBaseUserOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserOperation.h"

#import <Mantle/Mantle.h>

#import "NSString+URLEncoding.h"

#import "SNPAccountManager.h"

#import "SNPConstants.h"


@implementation SNPBaseUserOperation

#pragma mark - Initializers

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

    NSAssert(self.method, @"No method set for API operation!");
    NSAssert(self.endpoint, @"No endpoint set for API operation!");

    _receivedData = [NSMutableData new];

    NSString* accessToken = account.accessToken;
    if(accessToken == nil) {
        SNPMetadata* meta = [[SNPMetadata alloc] init];
        meta.errorMessage = [NSString stringWithFormat:NSLocalizedString(@"No access token found for account: %@", nil), account.name];
        meta.errorSlug = @"no_token";

        SNPResponse* response = [[SNPResponse alloc] init];
        response.metadata = meta;

        self.finishBlock(response);
        return;
    }

    // Query parameters
    NSMutableString* queryParams = [NSMutableString new];
    [self.parameters enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL* stop) {
        if([queryParams length] > 0) {
            [queryParams appendString:@"&"];
        }

        [queryParams appendFormat:@"%@=%@", [key encodedURLParameterString], [value encodedURLParameterString]];
    }];

    if([queryParams length] > 0) {
        NSString* urlString = [NSString stringWithFormat:@"%@?%@", [self.endpoint absoluteString], queryParams];
        self.endpoint = [NSURL URLWithString:urlString];
    }

    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:self.endpoint];

    // Provided headers
    [self.headers enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL* stop) {
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
    NSString* localMethod = [self.method uppercaseString];
    [request setHTTPMethod:localMethod];
    if([localMethod isEqualToString:@"POST"] ||
       [localMethod isEqualToString:@"PUT"] ||
       [localMethod isEqualToString:@"DELETE"]) {
        request.HTTPBody = self.body;

        if(self.bodyType) {
            [request addValue:self.bodyType
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

@end
