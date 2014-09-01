//
//  SNPGetMessagesOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetMessagesOperation.h"

#import "SNPMessage.h"

#import "SNPAPIUtils.h"


@implementation SNPGetMessagesOperation

#pragma mark - Initialization

- (instancetype)initWithMessageIds:(NSArray*)messageIds
               accountId:(NSString*)accountId
             finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.messageIds = messageIds;
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] getMessagesEndpointURL];
        self.serializationArrayClass = [SNPMessage class];
    }

    return self;
}


#pragma mark - Workhorse 

- (void)main {

    NSString* messageIdsString = [_messageIds componentsJoinedByString:@","];
    self.parameters = (@{
                       @"ids" : messageIdsString,
                       });

    [super main];
}

@end
