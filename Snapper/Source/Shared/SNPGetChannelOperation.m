//
//  SNPGetChannelOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetChannelOperation.h"

#import "SNPAPIUtils.h"


@implementation SNPGetChannelOperation

- (id)initWithChannelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super init];
    if(self) {
        self.channelId = channelId;
        self.accountId = accountId;
        self.finishBlock = finishBlock;
    }
}

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] getChannelEndpointURL:_channelId];

    [super main];
}

@end
