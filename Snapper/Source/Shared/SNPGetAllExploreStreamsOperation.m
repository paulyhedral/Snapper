//
//  SNPGetAllExploreStreamsOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 3/9/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPGetAllExploreStreamsOperation.h"

#import "SNPExploreStream.h"

#import "SNPAPIUtils.h"


@implementation SNPGetAllExploreStreamsOperation

#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedInstance] getAllExploreStreamsEndpointURL];
    self.serializationArrayClass = [SNPExploreStream class];

    [super main];
}

@end
