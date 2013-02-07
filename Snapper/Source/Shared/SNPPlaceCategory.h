//
//  SNPPlaceCategory.h
//  Snapper
//
//  Created by Paul Schifferer on 2/5/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>


@interface SNPPlaceCategory : MTLModel

@property (nonatomic, assign) NSInteger categoryId;
@property (nonatomic, retain) NSArray* labels;

@end