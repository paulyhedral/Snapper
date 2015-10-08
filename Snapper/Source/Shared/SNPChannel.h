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
@property (nonatomic, nonnull, retain) SNPUser* owner;
@property (nonatomic, nonnull, retain) SNPACL* readers;
@property (nonatomic, nullable, retain) SNPACL* editors;
@property (nonatomic, assign) NSUInteger recentMessageId;
@property (nonatomic, nonnull, copy) NSString* type;
@property (nonatomic, nonnull, retain) SNPACL* writers;
@property (nonatomic, assign) BOOL youCanEdit;
@property (nonatomic, assign) BOOL youSubscribed;
@property (nonatomic, assign) BOOL youMuted;
@property (nonatomic, nullable, copy) NSArray* annotations;
@property (nonatomic, assign, getter=isInactive) BOOL inactive;
@property (nonatomic, assign) NSUInteger messageCount;
@property (nonatomic, assign) NSUInteger subscriberCount;
@property (nonatomic, nullable, retain) SNPMessage* recentMessage;
@property (nonatomic, nullable, retain) SNPStreamMarker* marker;

@end
