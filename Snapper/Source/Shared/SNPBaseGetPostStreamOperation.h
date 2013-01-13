//
//  SNPBaseGetPostStreamOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/22/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserOperation.h"


@interface SNPBaseGetPostStreamOperation : SNPBaseUserOperation

// -- Properties --
@property (nonatomic, assign) NSUInteger beforeId;
@property (nonatomic, assign) NSUInteger sinceId;
@property (nonatomic, assign) NSUInteger count;
@property (nonatomic, assign) BOOL includeUser;
@property (nonatomic, assign) BOOL includeMachine;
@property (nonatomic, assign) BOOL includeMuted;
@property (nonatomic, assign) BOOL includeDeleted;
@property (nonatomic, assign) BOOL includeDirected;
@property (nonatomic, assign) BOOL includeAnnotations;
@property (nonatomic, assign) BOOL includePostAnnotations;
@property (nonatomic, assign) BOOL includeUserAnnotations;
@property (nonatomic, assign) BOOL includeStarredBy;
@property (nonatomic, assign) BOOL includeReposters;

@end
