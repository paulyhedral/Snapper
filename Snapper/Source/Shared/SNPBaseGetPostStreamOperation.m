//
//  SNPBaseGetPostStreamOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/22/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseGetPostStreamOperation.h"

#import "SNPPost.h"


@implementation SNPBaseGetPostStreamOperation

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
    if(_includeUser) {
        parameters[@"include_user"] = @(_includeUser);
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
    if(_includeDirected) {
        parameters[@"include_directed_posts"] = @(_includeDirected);
    }
    if(_includePostAnnotations) {
        parameters[@"include_post_annotations"] = @(_includePostAnnotations);
    }
    if(_includeUserAnnotations) {
        parameters[@"include_user_annotations"] = @(_includeUserAnnotations);
    }
    if(_includeStarredBy) {
        parameters[@"include_starred_by"] = @(_includeStarredBy);
    }
    if(_includeReposters) {
        parameters[@"include_reposters"] = @(_includeReposters);
    }

    self.parameters = parameters;

    self.serializationArrayClass = [SNPPost class];
    
    [super main];
}

@end
