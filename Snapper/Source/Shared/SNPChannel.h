//
//  SNPChannel.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>

#import "SNPUser.h"
#import "SNPACL.h"


@interface SNPChannel : MTLModel

@property (nonatomic, assign) BOOL hasUnread;
@property (nonatomic, assign) NSInteger channelId;
@property (nonatomic, retain) SNPUser* owner;
@property (nonatomic, retain) SNPACL* readers;
@property (nonatomic, assign) NSInteger recentMessageId;
@property (nonatomic, copy) NSString* type;
@property (nonatomic, retain) SNPACL* writers;
@property (nonatomic, assign) BOOL youCanEdit;
@property (nonatomic, assign) BOOL youSubscribed;
@property (nonatomic, retain) NSArray* annotations;

@end
