//
//  SNPBaseStreamOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/22/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseStreamOperation.h"

#import "SNPPost.h"


@implementation SNPBaseStreamOperation

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
    if(_includePostAnnotations) {
        parameters[@"include_post_annotations"] = @(_includePostAnnotations);
    }
    if(_includeStarredBy) {
        parameters[@"include_starred_by"] = @(_includeStarredBy);
    }
    if(_includeReposters) {
        parameters[@"include_reposters"] = @(_includeReposters);
    }

    if([[parameters allKeys] count]) {
        self.parameters = parameters;
    }

    [super main];
}

@end
