//
//  SNPGetChannelSubscribersOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetChannelSubscribersOperation.h"

#import "SNPUser.h"

#import "SNPAPIUtils.h"


@implementation SNPGetChannelSubscribersOperation

#pragma mark - Initialization

- (id)initWithChannelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] getChannelSubscribersEndpointURL:channelId];
        self.serializationArrayClass = [SNPUser class];
    }

    return self;
}

@end
