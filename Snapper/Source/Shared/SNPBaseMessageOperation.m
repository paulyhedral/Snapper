//
//  SNPBaseMessageOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 3/26/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseMessageOperation.h"


@implementation SNPBaseMessageOperation

@synthesize includeMachine = _includeMachine;
@synthesize includeMuted = _includeMuted;
@synthesize includeDeleted = _includeDeleted;
@synthesize includeMessageAnnotations = _includeMessageAnnotations;
@synthesize includeAnnotations = _includeAnnotations;
@synthesize includeUserAnnotations = _includeUserAnnotations;
@synthesize channelTypes = _channelTypes;

- (void)main {

    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];

    if(self.parameters) {
        [parameters addEntriesFromDictionary:self.parameters];
    }

    if(_includeMachine) {
        parameters[@"include_machine"] = @"1";
    }
    if(_includeMuted) {
        parameters[@"include_muted"] = @"1";
    }
    if(_includeDeleted) {
        parameters[@"include_deleted"] = @"1";
    }
    if(_includeMessageAnnotations) {
        parameters[@"include_message_annotations"] = @"1";
    }
    if(_includeAnnotations) {
        parameters[@"include_annotations"] = @"1";
    }
    if(_includeUserAnnotations) {
        parameters[@"include_user_annotations"] = @"1";
    }
    if(_channelTypes) {
        parameters[@"channel_types"] = [_channelTypes componentsJoinedByString:@","];
    }

    if([[parameters allKeys] count]) {
        self.parameters = parameters;
    }

    [super main];
}

@end
