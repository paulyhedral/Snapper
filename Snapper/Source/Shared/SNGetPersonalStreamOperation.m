//
//  SNGetPersonalStreamOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNGetPersonalStreamOperation.h"

#import "SNAPIUtils.h"


@implementation SNGetPersonalStreamOperation

- (void)main {

    if(_unified) {
        self.endpoint = [[SNAPIUtils sharedAPIUtils] getUnifiedPersonalStreamEndpointURL];
    }
    else {
        self.endpoint = [[SNAPIUtils sharedAPIUtils] getPersonalStreamEndpointURL];
    }

    [super main];
}

@end
