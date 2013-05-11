//
//  SNPGetChannelOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetChannelOperation.h"

#import "SNPChannel.h"

#import "SNPAPIUtils.h"


@implementation SNPGetChannelOperation

- (id)initWithChannelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.channelId = channelId;
        self.serializationRootClass = [SNPChannel class];
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] getChannelEndpointURL:_channelId];

    [super main];
}

@end
