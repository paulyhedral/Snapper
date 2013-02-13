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
@property (nonatomic, assign) NSInteger position;
@property (nonatomic, assign) NSInteger length;
@property (nonatomic, assign) NSInteger amendedLength;

@end
