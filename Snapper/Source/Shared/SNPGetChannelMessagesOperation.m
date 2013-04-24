//
//  SNPGetChannelMessagesOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetChannelMessagesOperation.h"

#import "SNPMessage.h"

#import "SNPAPIUtils.h"


@implementation SNPGetChannelMessagesOperation

#pragma mark - Initialization

- (id)initWithChannelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.channelId = channelId;
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] getChannelMessagesEndpointURL:channelId];
        self.serializationArrayClass = [SNPMessage class];
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    [self handlePaginationParameters];

    [super main];
}

- (void)handlePaginationParameters {

    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];

    if(self.parameters) {
        [parameters addEntriesFromDictionary:self.parameters];
    }

    if(self.beforeId) {
        parameters[@"before_id"] = @(self.beforeId);
    }
    if(self.sinceId) {
        parameters[@"since_id"] = @(self.sinceId);
    }
    if(self.count) {
        parameters[@"count"] = @(self.count);
    }

    if([[parameters allKeys] count]) {
        self.parameters = parameters;
    }
}

@end
