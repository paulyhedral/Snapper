//
//  SNPBaseMessageOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 3/26/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <Snapper/Snapper.h>


@interface SNPBaseMessageOperation : SNPBaseUserOperation

// -- Properties --
@property (nonatomic, assign) NSUInteger beforeId;
@property (nonatomic, assign) NSUInteger sinceId;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) BOOL includeMachine;
@property (nonatomic, assign) BOOL includeMuted;
@property (nonatomic, assign) BOOL includeDeleted;
@property (nonatomic, assign) BOOL includeAnnotations;
@property (nonatomic, assign) BOOL includeMessageAnnotations;
@property (nonatomic, assign) BOOL includeUserAnnotations;

@end
