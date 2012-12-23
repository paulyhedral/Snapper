//
//  SNGetMessagesOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNGetMessagesOperation.h"

#import "SNMessage.h"

#import "SNAPIUtils.h"


@implementation SNGetMessagesOperation

#pragma mark - Initialization

- (id)initWithMessageIds:(NSArray*)messageIds
               accountId:(NSString*)accountId
             finishBlock:(void (^)(SNResponse* response))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.messageIds = messageIds;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNAPIUtils sharedAPIUtils] getMessagesEndpointURL];

    NSString* messageIdsString = [_messageIds componentsJoinedByString:@","];
    self.parameters = (@{
                       @"ids" : messageIdsString,
                       });

    self.serializationArrayClass = [SNMessage class];

    [super main];
}

@end
