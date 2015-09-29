//
//  SNPGetBlockedUsersOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 6/8/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPGetBlockedUsersOperation.h"

#import "SNPUser.h"

#import "SNPAPIUtils.h"


@implementation SNPGetBlockedUsersOperation

#pragma mark - Initialization

- (instancetype)initWithUserId:(NSUInteger)userId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.userId = userId;
        self.serializationArrayClass = [SNPUser class];
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedInstance] getBlockedUsersEndpointURL:_userId];

    [super main];
}

@end
