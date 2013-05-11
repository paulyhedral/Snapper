//
//  SNPGetMyMessagesOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 4/15/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPGetMyMessagesOperation.h"

#import "SNPMessage.h"

#import "SNPAPIUtils.h"


@implementation SNPGetMyMessagesOperation

#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] getMyMessagesEndpointURL];
    self.serializationArrayClass = [SNPMessage class];

    [super main];
}

@end
