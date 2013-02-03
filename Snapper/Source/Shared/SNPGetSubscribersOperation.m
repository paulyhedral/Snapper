//
//  SNPGetSubscribersOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetSubscribersOperation.h"

#import "SNPUser.h"

#import "SNPAPIUtils.h"


@implementation SNPGetSubscribersOperation

#pragma mark - Initialization

- (id)initWithChannelIds:(NSArray*)channelIds
               accountId:(NSString*)accountId
             finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] getSubscribersEndpointURL];

    NSString* channelIdsString = [_channelIds componentsJoinedByString:@","];
    self.parameters = (@{
                       @"ids" : channelIdsString,
                       });

    self.serializationBlock = ^id(NSArray* responseData, NSError** error) {

        NSMutableArray* subscriberIds = [NSMutableArray new];

        for(NSString* subscriberIdStr in responseData) {
            NSInteger subscriberId = [subscriberIdStr integerValue];
            NSNumber* subscriberNum = @(subscriberId);
            [subscriberIds addObject:subscriberNum];
        }

        return subscriberIds;
    };

    [super main];
}

@end
