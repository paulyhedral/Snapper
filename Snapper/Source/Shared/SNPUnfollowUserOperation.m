//
//  SNPUnfollowUserOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPUnfollowUserOperation.h"

#import "SNPUser.h"

#import "SNPAPIUtils.h"


@implementation SNPUnfollowUserOperation

#pragma mark - Initialization

- (id)initWithUserId:(NSUInteger)userId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super init];
    if(self) {
        self.userId = userId;
        self.accountId = accountId;
        self.finishBlock = finishBlock;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] unfollowUserEndpointURL:_userId];
    self.method = @"DELETE";
    self.serializationRootClass = [SNPUser class];

    [super main];
}

@end
