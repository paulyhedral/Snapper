//
//  SNGetGlobalStreamOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNGetGlobalStreamOperation.h"

#import "SNAPIUtils.h"


@implementation SNGetGlobalStreamOperation

- (void)main {

    self.endpoint = [[SNAPIUtils sharedAPIUtils] getGlobalStreamEndpointURL];
    
    [super main];
}

@end
