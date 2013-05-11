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
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] searchUsersEndpointURL];
        self.serializationArrayClass = [SNPUser class];
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.parameters = (@{
                       @"q" : _queryString,
                       });

    [super main];
}

@end
