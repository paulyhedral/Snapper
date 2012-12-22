//
//  SNGetSubscribedChannelsOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNGetSubscribedChannelsOperation.h"

#import "SNAPIUtils.h"


@implementation SNGetSubscribedChannelsOperation

- (id)initWithAccountId:(NSString*)accountId
            finishBlock:(void (^)(SNResponse* response))finishBlock {

    self = [super init];
    if(self) {
        self.endpoint = [[SNAPIUtils sharedAPIUtils] getSubscribedChannelsEndpointURL];
        self.accountId = accountId;
        self.finishBlock = finishBlock;
    }

    return self;
}

@end
