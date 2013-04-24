//
//  SNPCommonParameters.h
//  Snapper
//
//  Created by Paul Schifferer on 4/15/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol SNPCommonParameters <NSObject>

@required
@property (nonatomic, assign) BOOL includeAnnotations;
@property (nonatomic, assign) BOOL includeUserAnnotations;

@end
