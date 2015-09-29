//
//  SNPUpdateUserCoverImageOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPUpdateUserCoverImageOperation.h"

#import "SNPAPIUtils.h"


@implementation SNPUpdateUserCoverImageOperation

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedInstance] updateUserCoverImageEndpointURL];

    [super main];
}

@end
