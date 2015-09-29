//
//  SNPGetMutedChannelsOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 3/13/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPGetMutedChannelsOperation.h"

#import "SNPChannel.h"

#import "SNPAPIUtils.h"


@implementation SNPGetMutedChannelsOperation

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedInstance] getMutedChannelsEndpointURL];
    self.serializationArrayClass = [SNPChannel class];

    [super main];
}

@end
