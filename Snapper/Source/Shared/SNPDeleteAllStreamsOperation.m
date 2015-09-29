//
//  SNPDeleteAllStreamsOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/23/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPDeleteAllStreamsOperation.h"

#import "SNPStream.h"

#import "SNPAPIUtils.h"


@implementation SNPDeleteAllStreamsOperation

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedInstance] deleteAllStreamsEndpointURL];
    self.method = @"DELETE";
    self.serializationArrayClass = [SNPStream class];

    [super main];
}

@end
