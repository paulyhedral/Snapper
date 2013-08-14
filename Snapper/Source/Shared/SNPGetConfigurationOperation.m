//
//  SNPGetConfigurationOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 8/13/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPGetConfigurationOperation.h"

#import "SNPConfiguration.h"

#import "SNPAPIUtils.h"


@implementation SNPGetConfigurationOperation

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] configurationEndpointURL];
    self.serializationRootClass = [SNPConfiguration class];

    [super main];
}

@end
