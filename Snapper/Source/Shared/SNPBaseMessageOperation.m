//
//  SNPBaseMessageOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 3/26/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseMessageOperation.h"


@implementation SNPBaseMessageOperation

- (void)main {

    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];

    if(self.parameters) {
        [parameters addEntriesFromDictionary:self.parameters];
    }

    if(_beforeId) {
        parameters[@"before_id"] = @(_beforeId);
    }
    if(_sinceId) {
        parameters[@"since_id"] = @(_sinceId);
    }
    if(_count) {
        parameters[@"count"] = @(_count);
    }
    if(_includeAnnotations) {
        parameters[@"include_annotations"] = @(_includeAnnotations);
    }
    if(_includeMachine) {
        parameters[@"include_machine"] = @(_includeMachine);
    }
    if(_includeMuted) {
        parameters[@"include_muted"] = @(_includeMuted);
    }
    if(_includeDeleted) {
        parameters[@"include_deleted"] = @(_includeDeleted);
    }
    if(_includeUserAnnotations) {
        parameters[@"include_user_annotations"] = @(_includeUserAnnotations);
    }

    if([[parameters allKeys] count]) {
        self.parameters = parameters;
    }

    [super main];
}

@end
