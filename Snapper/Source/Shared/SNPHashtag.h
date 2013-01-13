//
//  SNPHashtag.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPEntity.h"


@interface SNPHashtag : SNPEntity

@property (nonatomic, copy) NSString* name;
@property (nonatomic, assign) NSInteger position;
@property (nonatomic, assign) NSInteger length;

@end
