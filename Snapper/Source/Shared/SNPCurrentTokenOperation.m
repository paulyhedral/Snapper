//
//  SNPCurrentTokenOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPCurrentTokenOperation.h"

#import "SNPToken.h"

#import "SNPAPIUtils.h"


@implementation SNPCurrentTokenOperation

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] tokenEndpointURL];
    self.serializationRootClass = [SNPToken class];

    [super main];
}

@end
