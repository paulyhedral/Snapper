//
//  SNPPostParameters.h
//  Snapper
//
//  Created by Paul Schifferer on 4/15/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPCommonParameters.h"


@protocol SNPPostParameters <SNPCommonParameters>

@required
@property (nonatomic, assign) BOOL includeMuted;
@property (nonatomic, assign) BOOL includeDeleted;
@property (nonatomic, assign) BOOL includeDirectedPosts;
@property (nonatomic, assign) BOOL includeMachine;
@property (nonatomic, assign) BOOL includeStarredBy;
@property (nonatomic, assign) BOOL includeReposters;
@property (nonatomic, assign) BOOL includePostAnnotations;

@end
