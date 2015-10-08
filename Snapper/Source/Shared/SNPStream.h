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

typedef NS_ENUM(NSInteger, SNPStreamType) {
    SNPStreamTypeLongPoll,
};

@interface SNPStream : MTLModel
<MTLJSONSerializing>

@property (nonatomic, assign) NSUInteger streamId;
@property (nonatomic, nonnull, copy) NSURL* endpoint;
@property (nonatomic, nullable, retain) SNPFilter* filter;
@property (nonatomic, nonnull, copy) NSArray* objectTypes;
@property (nonatomic, assign) SNPStreamType type;
@property (nonatomic, nonnull, copy) NSString* key;

@end
