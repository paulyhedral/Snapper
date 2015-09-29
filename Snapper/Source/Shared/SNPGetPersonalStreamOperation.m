//
//  SNPGetPersonalStreamOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetPersonalStreamOperation.h"

#import "SNPPost.h"

#import "SNPAPIUtils.h"


@implementation SNPGetPersonalStreamOperation

- (void)main {

    if(_unified) {
        self.endpoint = [[SNPAPIUtils sharedInstance] getUnifiedPersonalStreamEndpointURL];
    }
    else {
        self.endpoint = [[SNPAPIUtils sharedInstance] getPersonalStreamEndpointURL];
    }
    self.serializationArrayClass = [SNPPost class];

    [super main];
}

@end
