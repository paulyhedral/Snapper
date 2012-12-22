//
//  SNGetUserMuteesOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNGetUserMuteesOperation.h"

#import "SNUser.h"

#import "SNAPIUtils.h"


@implementation SNGetUserMuteesOperation

#pragma mark - Initialization

- (id)initWithAccountId:(NSString*)accountId
         finishBlock:(void (^)(SNResponse*))finishBlock {

    self = [super init];
    if(self) {
        self.accountId = accountId;
        self.finishBlock = finishBlock;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNAPIUtils sharedAPIUtils] getMutedUsersEndpointURL];
    self.serializationArrayClass = [SNUser class];

    [super main];
}

@end
