//
//  SNPDeleteMessageOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPDeleteMessageOperation.h"

#import "SNPMessage.h"

#import "SNPAPIUtils.h"


@implementation SNPDeleteMessageOperation

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
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] deleteMessageEndpointURL:_channelId
                                                                messageId:_messageId];
    self.method = @"DELETE";
    self.serializationRootClass = [SNPMessage class];

    [super main];
}

@end
