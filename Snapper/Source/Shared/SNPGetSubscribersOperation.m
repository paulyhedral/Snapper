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

- (instancetype)initWithChannelIds:(NSArray*)channelIds
               accountId:(NSString*)accountId
             finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.endpoint = [[SNPAPIUtils sharedInstance] getSubscribersEndpointURL];
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

    NSString* channelIdsString = [_channelIds componentsJoinedByString:@","];
    self.parameters = (@{
                       @"ids" : channelIdsString,
                       });

    [super main];
}

@end
