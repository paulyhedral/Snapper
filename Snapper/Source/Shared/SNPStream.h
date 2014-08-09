//
//  SNPStream.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>

#import "SNPFilter.h"


#define SNP_STREAM_OBJECT_TYPE_POST (@"post")
#define SNP_STREAM_OBJECT_TYPE_STAR (@"star")
#define SNP_STREAM_OBJECT_TYPE_USER_FOLLOW (@"user_follow")
#define SNP_STREAM_OBJECT_TYPE_STREAM_MARKER (@"stream_marker")
#define SNP_STREAM_OBJECT_TYPE_MESSAGE (@"message")
#define SNP_STREAM_OBJECT_TYPE_CHANNEL (@"channel")
#define SNP_STREAM_OBJECT_TYPE_CHANNEL_SUBSCRIPTION (@"channel_subscription")

typedef enum : NSInteger {
    SNPStreamTypeLongPoll,
} SNPStreamType;

@interface SNPStream : MTLModel
<MTLJSONSerializing>

@property (nonatomic, assign) NSInteger streamId;
@property (nonatomic, retain) NSURL* endpoint;
@property (nonatomic, retain) SNPFilter* filter;
@property (nonatomic, retain) NSArray* objectTypes;
@property (nonatomic, assign) SNPStreamType type;
@property (nonatomic, copy) NSString* key;

@end
