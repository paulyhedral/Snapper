//
//  SNPSearchUsersOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPSearchUsersOperation.h"

#import "SNPUser.h"

#import "SNPAPIUtils.h"


@implementation SNPSearchUsersOperation

#pragma mark - Initialization

- (id)initWithQueryString:(NSString*)queryString
                accountId:(NSString*)accountId
              finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.queryString = queryString;
        self.parameters = (@{
                           @"q" : queryString,
                           });
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] searchUsersEndpointURL];
        self.serializationArrayClass = [SNPUser class];
    }

    return self;
}

- (void)main {

    [self handleCommonParameters];
    [self handlePaginationParameters];

    [super main];
}

- (void)handlePaginationParameters {

    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];

    if(self.parameters) {
        [parameters addEntriesFromDictionary:self.parameters];
    }

    if(self.beforeId) {
        parameters[@"before_id"] = @(self.beforeId);
    }
    if(self.sinceId) {
        parameters[@"since_id"] = @(self.sinceId);
    }
    if(self.count) {
        parameters[@"count"] = @(self.count);
    }

    if([[parameters allKeys] count]) {
        self.parameters = parameters;
    }
}

@synthesize includeAnnotations = _includeAnnotations;
@synthesize includeUserAnnotations = _includeUserAnnotations;

- (void)handleCommonParameters {

    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];

    if(self.parameters) {
        [parameters addEntriesFromDictionary:self.parameters];
    }

    if(_includeAnnotations) {
        parameters[@"include_annotations"] = @"1";
    }
    if(_includeUserAnnotations) {
        parameters[@"include_user_annotations"] = @"1";
    }

    if([[parameters allKeys] count]) {
        self.parameters = parameters;
    }
}

@end
