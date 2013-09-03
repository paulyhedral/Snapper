//
//  SNPMention.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPEntity.h"


@interface SNPMention : SNPEntity

@property (nonatomic, copy) NSString* name;
@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, assign) NSInteger position;
@property (nonatomic, assign) NSInteger length;
@property (nonatomic, assign) BOOL leading;

@end
