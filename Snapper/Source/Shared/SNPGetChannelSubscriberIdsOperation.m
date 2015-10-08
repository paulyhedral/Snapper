//
//  SNPGetChannelSubscriberIdsOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 2/3/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPGetChannelSubscriberIdsOperation.h"

#import "SNPAPIUtils.h"


@implementation SNPGetChannelSubscriberIdsOperation

#pragma mark - Initialization

- (instancetype)initWithChannelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.serializationBlock = ^id(NSArray* responseData, NSError** error) {

            NSMutableArray* subscriberIds = [NSMutableArray new];

            for(NSString* subscriberIdStr in responseData) {
                NSInteger subscriberId = [subscriberIdStr integerValue];
                NSNumber* subscriberNum = @(subscriberId);
                [subscriberIds addObject:subscriberNum];
            }

            return subscriberIds;
        };
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedInstance] getChannelSubscribersEndpointURL:_channelId];

    [super main];
}

@end
