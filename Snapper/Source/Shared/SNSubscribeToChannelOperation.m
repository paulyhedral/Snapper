//
//  SNSubscribeToChannelOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNSubscribeToChannelOperation.h"

#import "SNChannel.h"

#import "SNAPIUtils.h"


@implementation SNSubscribeToChannelOperation

#pragma mark - Initializers

- (id)initWithChannelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNResponse* response))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.channelId = channelId;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNAPIUtils sharedAPIUtils] subscribeToChannelEndpointURL:_channelId];
    self.method = @"POST";
    self.serializationRootClass = [SNChannel class];

    [super main];
}

@end
