//
//  SNPGetUsersOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetUsersOperation.h"

#import "SNPUser.h"

#import "SNPAPIUtils.h"


@implementation SNPGetUsersOperation

#pragma mark - Initialization

- (id)initWithUserIds:(NSArray*)userIds
            accountId:(NSString*)accountId
          finishBlock:(void (^)(SNPResponse *))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.userIds = userIds;
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] getUsersEndpointURL];
        self.serializationArrayClass = [SNPUser class];
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    NSString* userIdsString = [_userIds componentsJoinedByString:@","];
    self.parameters = (@{
                       @"ids" : userIdsString,
                       });

    [super main];
}

@end
