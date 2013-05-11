//
//  SNPGetUserMuteesOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetUserMuteesOperation.h"

#import "SNPUser.h"

#import "SNPAPIUtils.h"


@implementation SNPGetUserMuteesOperation

#pragma mark - Initialization

- (id)initWithAccountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] getMutedUsersEndpointURL];
        self.serializationArrayClass = [SNPUser class];
    }

    return self;
}

@end
