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

- (id)initWithChannelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] getChannelSubscribersEndpointURL:channelId];
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

- (void)main {

    [self handleChannelParameters];

    [super main];
}

@synthesize channelTypes = _channelTypes;
@synthesize includeMarker = _includeMarker;
@synthesize includeRead = _includeRead;
@synthesize includeRecentMessage = _includeRecentMessage;
@synthesize includeMessageAnnotations = _includeMessageAnnotations;

- (void)handleChannelParameters {

    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];

    if(self.parameters) {
        [parameters addEntriesFromDictionary:self.parameters];
    }

    if(_channelTypes) {
        parameters[@"channel_types"] = [_channelTypes componentsJoinedByString:@","];
    }
    if(_includeMarker) {
        parameters[@"include_marker"] = @"1";
    }
    if(_includeRead) {
        parameters[@"include_read"] = @"1";
    }
    if(_includeRecentMessage) {
        parameters[@"include_recent_message"] = @"1";
    }
    if(_includeMessageAnnotations) {
        parameters[@"include_message_annotations"] = @"1";
    }

    if([[parameters allKeys] count]) {
        self.parameters = parameters;
    }
}

@end
