//
//  SNPChannel.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>

#import "SNPUser.h"
#import "SNPMessage.h"
#import "SNPACL.h"
#import "SNPStreamMarker.h"


@interface SNPChannel : MTLModel

@property (nonatomic, assign) BOOL hasUnread;
@property (nonatomic, assign) NSInteger channelId;
@property (nonatomic, retain) SNPUser* owner;
@property (nonatomic, retain) SNPACL* readers;
@property (nonatomic, retain) SNPACL* editors;
@property (nonatomic, assign) NSInteger recentMessageId;
@property (nonatomic, copy) NSString* type;
@property (nonatomic, retain) SNPACL* writers;
@property (nonatomic, assign) BOOL youCanEdit;
@property (nonatomic, assign) BOOL youSubscribed;
@property (nonatomic, assign) BOOL youMuted;
@property (nonatomic, retain) NSArray* annotations;
@property (nonatomic, assign) BOOL isInactive;
@property (nonatomic, assign) NSInteger messageCount;
@property (nonatomic, assign) NSInteger subscriberCount;
@property (nonatomic, retain) SNPMessage* recentMessage;
@property (nonatomic, retain) SNPStreamMarker* marker;

@end
