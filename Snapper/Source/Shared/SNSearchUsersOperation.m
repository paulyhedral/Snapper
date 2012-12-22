//
//  SNSearchUsersOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNSearchUsersOperation.h"

#import "SNUser.h"

#import "SNAPIUtils.h"


@implementation SNSearchUsersOperation

#pragma mark - Initialization

- (id)initWithQueryString:(NSString*)queryString
                accountId:(NSString*)accountId
              finishBlock:(void (^)(SNResponse* response))finishBlock {

    self = [super init];
    if(self) {
        self.queryString = queryString;
        self.accountId = accountId;
        self.finishBlock = finishBlock;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.parameters = (@{
                       @"q" : _queryString,
                       });
    self.endpoint = [[SNAPIUtils sharedAPIUtils] searchUsersEndpointURL];
    self.serializationArrayClass = [SNUser class];

    [super main];
}

@end
