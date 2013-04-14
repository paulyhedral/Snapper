//
//  SNPBaseStreamOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/22/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"


@interface SNPBaseStreamOperation : SNPBaseUserTokenOperation

// -- Properties --
@property (nonatomic, assign) NSUInteger beforeId;
@property (nonatomic, assign) NSUInteger sinceId;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) BOOL includePostAnnotations;
@property (nonatomic, assign) BOOL includeStarredBy;
@property (nonatomic, assign) BOOL includeReposters;

@end
