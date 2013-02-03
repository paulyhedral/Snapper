//
//  SNPGetChannelsOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetChannelsOperation.h"

#import "SNPChannel.h"

#import "SNPAPIUtils.h"


@implementation SNPGetChannelsOperation

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

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] getChannelsEndpointURL];

    NSString* channelIdsString = [_channelIds componentsJoinedByString:@","];
    self.parameters = (@{
                       @"ids" : channelIdsString,
                       });

    self.serializationArrayClass = [SNPChannel class];

    [super main];
}

@end
