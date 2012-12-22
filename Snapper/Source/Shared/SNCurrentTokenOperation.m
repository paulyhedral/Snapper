//
//  SNCurrentTokenOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNCurrentTokenOperation.h"

#import "SNToken.h"

#import "SNAPIUtils.h"


@implementation SNCurrentTokenOperation

- (void)main {

    self.endpoint = [[SNAPIUtils sharedAPIUtils] tokenEndpointURL];
    self.serializationRootClass = [SNToken class];

    [super main];
}

@end
