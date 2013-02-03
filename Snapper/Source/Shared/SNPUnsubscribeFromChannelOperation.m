//
//  SNPUnsubscribeFromChannelOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPUnsubscribeFromChannelOperation.h"

#import "SNPChannel.h"

#import "SNPAPIUtils.h"


@implementation SNPUnsubscribeFromChannelOperation

#pragma mark - Initializers

- (id)initWithChannelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.channelId = channelId;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] unsubscribeFromChannelEndpointURL:_channelId];
    self.method = @"DELETE";
    self.serializationRootClass = [SNPChannel class];

    [super main];
}

@end
