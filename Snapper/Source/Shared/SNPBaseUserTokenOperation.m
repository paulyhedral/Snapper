//
//  SNPBaseUserTokenOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"

#import <Mantle/Mantle.h>

#import "NSString+URLEncoding.h"

#import "SNPAccountManager.h"

#import "SNPConstants.h"


@implementation SNPBaseUserTokenOperation

#pragma mark - Initializers

- (id)initWithAccountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super init];
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
    NSAssert(self.method, @"No method set for API operation!");
    NSAssert(self.endpoint, @"No endpoint set for API operation!");

    _receivedData = [NSMutableData new];

    NSString* accessToken = nil;
    NSString* tokenType = nil;

    if(_accountId) {
        SNPAccount* account = [[SNPAccountManager sharedAccountManager] accountForId:_accountId];
//        NSAssert(account, @"No account found for ID: %@", _accountId);

        if(account) {
        accessToken = account.accessToken;
        tokenType = account.tokenType;
        if(accessToken == nil) {
            SNPMetadata* meta = [[SNPMetadata alloc] init];
            meta.errorMessage = [NSString stringWithFormat:NSLocalizedString(@"No access token found for account: %@", nil), account.name];
            meta.errorSlug = @"no_token";

            SNPResponse* response = [[SNPResponse alloc] init];
            response.metadata = meta;

            self.finishBlock(response);
            return;
        }
        }
    }

    // Query parameters
    NSMutableString* queryParams = [NSMutableString new];
    [self handleQueryParameters];
    [self.parameters enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL* stop) {
        if([queryParams length] > 0) {
            [queryParams appendString:@"&"];
        }

        if([value isKindOfClass:[NSNumber class]]) {
            [queryParams appendFormat:@"%@=%@", [key encodedURLParameterString], value];
        }
        else {
            [queryParams appendFormat:@"%@=%@", [key encodedURLParameterString], [value encodedURLParameterString]];
        }
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
    if(accessToken) {
        NSString* tokenValue = [NSString stringWithFormat:@"%@ %@", tokenType, accessToken];
        [request addValue:tokenValue
       forHTTPHeaderField:@"Authorization"];
    }

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

- (void)handleQueryParameters {

    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];

    if(self.parameters) {
        [parameters addEntriesFromDictionary:self.parameters];
    }

    // Pagination
    if(_beforeId) {
        parameters[@"before_id"] = @(_beforeId);
    }
    if(_sinceId) {
        parameters[@"since_id"] = @(_sinceId);
    }
    if(_count) {
        parameters[@"count"] = @(_count);
    }

    // General
    if(_includeMuted) {
        parameters[@"include_muted"] = @"1";
    }
    if(_includeDeleted) {
        parameters[@"include_deleted"] = @"1";
    }
    if(_includeDirectedPosts) {
        parameters[@"include_directed_posts"] = @"1";
    }
    if(_includeMachine) {
        parameters[@"include_machine"] = @"1";
    }
    if(_includeStarredBy) {
        parameters[@"include_starred_by"] = @"1";
    }
    if(_includeReposters) {
        parameters[@"include_reposters"] = @"1";
    }
    if(_includePostAnnotations) {
        parameters[@"include_post_annotations"] = @"1";
    }
    if(_includeAnnotations) {
        parameters[@"include_annotations"] = @"1";
    }
    if(_includeUserAnnotations) {
        parameters[@"include_user_annotations"] = @"1";
    }

    // Channel/message
    if(_channelTypes) {
        parameters[@"channel_types"] = [_channelTypes componentsJoinedByString:@","];
    }
    if(_includeMarker) {
        parameters[@"include_marker"] = @"1";
    }
    if(_includeRead) {
        parameters[@"include_read"] = @"1";
    }
    if(_includeRecentMessage) {
        parameters[@"include_recent_message"] = @"1";
    }
    if(_includeMessageAnnotations) {
        parameters[@"include_message_annotations"] = @"1";
    }

    // File
    if(_fileTypes) {
        parameters[@"include_annotations"] = [_fileTypes componentsJoinedByString:@","];
    }
    if(_includeIncomplete) {
        parameters[@"include_incomplete"] = @"1";
    }
    if(_includePrivate) {
        parameters[@"include_private"] = @"1";
    }
    if(_includeFileAnnotations) {
        parameters[@"include_file_annotations"] = @"1";
    }

    // Common
    if(_includeAnnotations) {
        parameters[@"include_annotations"] = @"1";
    }
    if(_includeUserAnnotations) {
        parameters[@"include_user_annotations"] = @"1";
    }
    if(_includeHTML) {
        parameters[@"include_html"] = @"1";
    }
    
    if([[parameters allKeys] count]) {
        self.parameters = parameters;
    }
}

@end
