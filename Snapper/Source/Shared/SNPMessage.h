//
//  SNPMessage.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>

#import "SNPUser.h"


@interface SNPMessage : MTLModel
<MTLJSONSerializing>

@property (nonatomic, assign) NSUInteger channelId;
@property (nonatomic, assign) NSUInteger messageId;
@property (nonatomic, retain) SNPUser* user;
@property (nonatomic, copy) NSDate* createdAt;
@property (nonatomic, copy) NSString* text;
@property (nonatomic, copy) NSString* html;
@property (nonatomic, copy) NSString* sourceName;
@property (nonatomic, copy) NSString* sourceLink;
@property (nonatomic, copy) NSString* sourceClientId;
@property (nonatomic, assign) BOOL machineOnly;
@property (nonatomic, retain) NSArray* annotations;
@property (nonatomic, retain) NSArray* mentions;
@property (nonatomic, retain) NSArray* hashtags;
@property (nonatomic, retain) NSArray* links;
@property (nonatomic, assign) NSUInteger threadId;
@property (nonatomic, assign) NSUInteger numReplies;
@property (nonatomic, assign) BOOL deleted;

@end
