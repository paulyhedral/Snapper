//
//  SNPMention.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPEntity.h"


@interface SNPMention : SNPEntity

@property (nonatomic, nonnull, copy) NSString* name;
@property (nonatomic, assign) NSUInteger userId;
@property (nonatomic, assign) NSUInteger position;
@property (nonatomic, assign) NSUInteger length;
@property (nonatomic, assign, getter=isLeading) BOOL leading;

@end
