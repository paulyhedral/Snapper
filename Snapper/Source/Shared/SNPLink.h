//
//  SNPLink.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPEntity.h"


@interface SNPLink : SNPEntity

@property (nonatomic, copy) NSString* text;
@property (nonatomic, copy) NSURL* URL;
@property (nonatomic, assign) NSUInteger position;
@property (nonatomic, assign) NSUInteger length;
@property (nonatomic, assign) NSUInteger amendedLength;

@end
