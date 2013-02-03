//
//  SNPGetMessageOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetMessageOperation.h"

#import "SNPMessage.h"

#import "SNPAPIUtils.h"


@implementation SNPGetMessageOperation

#pragma mark - Initialization

- (id)initWithMessageId:(NSUInteger)messageId
              channelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.messageId = messageId;
        self.channelId = channelId;
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] getMessageEndpointURL:channelId
                                                                  messageId:messageId];
        self.serializationRootClass = [SNPMessage class];
    }

    return self;
}

@end
