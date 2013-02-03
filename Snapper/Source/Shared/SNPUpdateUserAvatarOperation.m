//
//  SNPUpdateUserAvatarOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPUpdateUserAvatarOperation.h"

#import "SNPAPIUtils.h"


@implementation SNPUpdateUserAvatarOperation

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] updateUserAvatarEndpointURL];

    [super main];
}

@end
