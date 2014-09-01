//
//  SNPUnmuteChannelOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 3/13/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPUnmuteChannelOperation.h"

#import "SNPChannel.h"

#import "SNPAPIUtils.h"


@implementation SNPUnmuteChannelOperation

- (instancetype)initWithChannelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.method = @"DELETE";
        self.serializationRootClass = [SNPChannel class];
        self.channelId = channelId;
    }

    return self;
}

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] unmuteChannelEndpointURL:_channelId];

    [super main];
}

@end
