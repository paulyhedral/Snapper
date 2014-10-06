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
<MTLJSONSerializing>

@property (nonatomic, assign) BOOL hasUnread;
@property (nonatomic, assign) NSUInteger channelId;
@property (nonatomic, retain) SNPUser* owner;
@property (nonatomic, retain) SNPACL* readers;
@property (nonatomic, retain) SNPACL* editors;
@property (nonatomic, assign) NSUInteger recentMessageId;
@property (nonatomic, copy) NSString* type;
@property (nonatomic, retain) SNPACL* writers;
@property (nonatomic, assign) BOOL youCanEdit;
@property (nonatomic, assign) BOOL youSubscribed;
@property (nonatomic, assign) BOOL youMuted;
@property (nonatomic, copy) NSArray* annotations;
@property (nonatomic, assign, getter=isInactive) BOOL inactive;
@property (nonatomic, assign) NSUInteger messageCount;
@property (nonatomic, assign) NSUInteger subscriberCount;
@property (nonatomic, retain) SNPMessage* recentMessage;
@property (nonatomic, retain) SNPStreamMarker* marker;

@end
