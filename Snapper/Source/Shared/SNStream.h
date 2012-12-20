//
//  SNStream.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>

#import "SNFilter.h"


#define SN_STREAM_OBJECT_TYPE_POST (@"post")
#define SN_STREAM_OBJECT_TYPE_STAR (@"star")
#define SN_STREAM_OBJECT_TYPE_USER_FOLLOW (@"user_follow")
#define SN_STREAM_OBJECT_TYPE_STREAM_MARKER (@"stream_marker")
#define SN_STREAM_OBJECT_TYPE_MESSAGE (@"message")
#define SN_STREAM_OBJECT_TYPE_CHANNEL (@"channel")
#define SN_STREAM_OBJECT_TYPE_CHANNEL_SUBSCRIPTION (@"channel_subscription")

typedef enum : NSInteger {
    SNStreamTypeLongPoll,
} SNStreamType;

@interface SNStream : MTLModel

@property (nonatomic, assign) NSInteger streamId;
@property (nonatomic, retain) NSURL* endpoint;
@property (nonatomic, retain) SNFilter* filter;
@property (nonatomic, retain) NSArray* objectTypes;
@property (nonatomic, assign) SNStreamType type;
@property (nonatomic, copy) NSString* key;

@end
