//
//  SNPGetSubscribedChannelsOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetSubscribedChannelsOperation.h"

#import "SNPAPIUtils.h"


@implementation SNPGetSubscribedChannelsOperation

- (id)initWithAccountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super init];
    if(self) {
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] getSubscribedChannelsEndpointURL];
        self.accountId = accountId;
        self.finishBlock = finishBlock;
    }

    return self;
}

@end
