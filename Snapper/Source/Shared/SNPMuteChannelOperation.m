//
//  SNPMuteChannelOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 3/13/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPMuteChannelOperation.h"

#import "SNPChannel.h"

#import "SNPAPIUtils.h"


@implementation SNPMuteChannelOperation

- (instancetype)initWithChannelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.channelId = channelId;
        self.method = @"POST";
        self.serializationRootClass = [SNPChannel class];
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedInstance] muteChannelEndpointURL:_channelId];

    [super main];
}

@end
