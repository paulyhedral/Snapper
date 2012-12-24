//
//  SNDeleteMessageOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNDeleteMessageOperation.h"

#import "SNMessage.h"

#import "SNAPIUtils.h"


@implementation SNDeleteMessageOperation

#pragma mark - Initialization

- (id)initWithMessageId:(NSUInteger)messageId
              channelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNResponse*))finishBlock {

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

    self.endpoint = [[SNAPIUtils sharedAPIUtils] deleteMessageEndpointURL:_channelId
                                                                messageId:_messageId];
    self.method = @"DELETE";
    self.serializationRootClass = [SNMessage class];

    [super main];
}

@end
