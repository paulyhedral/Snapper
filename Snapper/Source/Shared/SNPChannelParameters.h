//
//  SNPChannelParameters.h
//  Snapper
//
//  Created by Paul Schifferer on 4/15/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPCommonParameters.h"


@protocol SNPChannelParameters <SNPCommonParameters>

@required
@property (nonatomic, copy) NSArray* channelTypes;
@property (nonatomic, assign) BOOL includeMarker;
@property (nonatomic, assign) BOOL includeRead;
@property (nonatomic, assign) BOOL includeRecentMessage;
@property (nonatomic, assign) BOOL includeMessageAnnotations;

@end
