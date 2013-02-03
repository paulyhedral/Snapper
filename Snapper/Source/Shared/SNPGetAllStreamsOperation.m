//
//  SNPGetAllStreamsOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/23/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetAllStreamsOperation.h"

#import "SNPStream.h"

#import "SNPAPIUtils.h"


@implementation SNPGetAllStreamsOperation

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] getAllStreamsEndpointURL];
    self.serializationArrayClass = [SNPStream class];

    [super main];
}

@end
