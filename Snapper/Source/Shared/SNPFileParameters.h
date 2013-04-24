//
//  SNPFileParameters.h
//  Snapper
//
//  Created by Paul Schifferer on 4/15/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPCommonParameters.h"


@protocol SNPFileParameters <SNPCommonParameters>

@required
@property (nonatomic, copy) NSArray* fileTypes;
@property (nonatomic, assign) BOOL includeIncomplete;
@property (nonatomic, assign) BOOL includePrivate;
@property (nonatomic, assign) BOOL includeFileAnnotations;

@end
