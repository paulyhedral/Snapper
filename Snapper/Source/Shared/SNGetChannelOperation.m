//
//  SNGetChannelOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNGetChannelOperation.h"

#import "SNAPIUtils.h"


@implementation SNGetChannelOperation

- (id)initWithChannelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNResponse*))finishBlock {

    self = [super init];
    if(self) {
        self.channelId = channelId;
        self.accountId = accountId;
        self.finishBlock = finishBlock;
    }
}

- (void)main {

    self.endpoint = [[SNAPIUtils sharedAPIUtils] getChannelEndpointURL:_channelId];

    [super main];
}

@end
