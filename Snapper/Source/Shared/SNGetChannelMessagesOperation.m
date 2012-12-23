//
//  SNGetChannelMessagesOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNGetChannelMessagesOperation.h"

#import "SNMessage.h"

#import "SNAPIUtils.h"


@implementation SNGetChannelMessagesOperation

#pragma mark - Initialization

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

    self.endpoint = [[SNAPIUtils sharedAPIUtils] getChannelMessagesEndpointURL:_channelId];
    self.serializationRootClass = [SNMessage class];
    
    [super main];
}

@end
