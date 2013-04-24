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
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] getUnifiedPersonalStreamEndpointURL];
    }
    else {
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] getPersonalStreamEndpointURL];
    }
    self.serializationArrayClass = [SNPPost class];

    [self handlePaginationParameters];
    [self handlePostParameters];

    [super main];
}

- (void)handlePaginationParameters {

    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];

    if(self.parameters) {
        [parameters addEntriesFromDictionary:self.parameters];
    }

    if(self.beforeId) {
        parameters[@"before_id"] = @(self.beforeId);
    }
    if(self.sinceId) {
        parameters[@"since_id"] = @(self.sinceId);
    }
    if(self.count) {
        parameters[@"count"] = @(self.count);
    }

    if([[parameters allKeys] count]) {
        self.parameters = parameters;
    }
}

@synthesize includeAnnotations = _includeAnnotations;
@synthesize includeUserAnnotations = _includeUserAnnotations;

@synthesize includeMuted = _includeMuted;
@synthesize includeDeleted = _includeDeleted;
@synthesize includeDirectedPosts = _includeDirectedPosts;
@synthesize includeMachine = _includeMachine;
@synthesize includeStarredBy = _includeStarredBy;
@synthesize includeReposters = _includeReposters;
@synthesize includePostAnnotations = _includePostAnnotations;

- (void)handlePostParameters {

    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];

    if(self.parameters) {
        [parameters addEntriesFromDictionary:self.parameters];
    }

    if(_includeMuted) {
        parameters[@"include_muted"] = @"1";
    }
    if(_includeDeleted) {
        parameters[@"include_deleted"] = @"1";
    }
    if(_includeDirectedPosts) {
        parameters[@"include_directed_posts"] = @"1";
    }
    if(_includeMachine) {
        parameters[@"include_machine"] = @"1";
    }
    if(_includeStarredBy) {
        parameters[@"include_starred_by"] = @"1";
    }
    if(_includeReposters) {
        parameters[@"include_reposters"] = @"1";
    }
    if(_includePostAnnotations) {
        parameters[@"include_post_annotations"] = @"1";
    }
    if(_includeAnnotations) {
        parameters[@"include_annotations"] = @"1";
    }
    if(_includeUserAnnotations) {
        parameters[@"include_user_annotations"] = @"1";
    }

    if([[parameters allKeys] count]) {
        self.parameters = parameters;
    }
}

@end
