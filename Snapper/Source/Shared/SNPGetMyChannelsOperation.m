//
//  SNPGetMyChannelsOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 8/30/14.
//  Copyright (c) 2014 Pilgrimage Software. All rights reserved.
//

#import "SNPGetMyChannelsOperation.h"

#import "SNPChannel.h"

#import "SNPAPIUtils.h"


@implementation SNPGetMyChannelsOperation

#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedInstance] getMyChannelsEndpointURL];
    self.serializationArrayClass = [SNPChannel class];

    [super main];
}

@end
