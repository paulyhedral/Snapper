//
//  SNPMessageParameters.h
//  Snapper
//
//  Created by Paul Schifferer on 4/15/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPCommonParameters.h"


@protocol SNPMessageParameters <SNPCommonParameters>

@required
@property (nonatomic, retain) NSArray* channelTypes;
@property (nonatomic, assign) BOOL includeMessageAnnotations;
@property (nonatomic, assign) BOOL includeMachine;
@property (nonatomic, assign) BOOL includeMuted;
@property (nonatomic, assign) BOOL includeDeleted;

@end
