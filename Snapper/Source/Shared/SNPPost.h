//
//  SNPPost.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>

#import "SNPUser.h"


@interface SNPPost : MTLModel
<MTLJSONSerializing>

@property (nonatomic, assign) NSUInteger postId;
@property (nonatomic, retain) SNPUser* user;
@property (nonatomic, copy) NSDate* createdAt;
@property (nonatomic, copy) NSString* text;
@property (nonatomic, copy) NSString* html;
@property (nonatomic, copy) NSString* sourceName;
@property (nonatomic, copy) NSString* sourceLink;
@property (nonatomic, copy) NSString* sourceClientId;
@property (nonatomic, assign, getter=isMachineOnly) BOOL machineOnly;
@property (nonatomic, assign) NSUInteger replyTo;
@property (nonatomic, assign) NSUInteger threadId;
@property (nonatomic, copy) NSURL* canonicalURL;
@property (nonatomic, assign) NSUInteger numReplies;
@property (nonatomic, assign) NSUInteger numReposts;
@property (nonatomic, assign) NSUInteger numStars;
@property (nonatomic, copy) NSArray* annotations;
@property (nonatomic, copy) NSArray* mentions;
@property (nonatomic, copy) NSArray* hashtags;
@property (nonatomic, copy) NSArray* links;
@property (nonatomic, assign) BOOL youReposted;
@property (nonatomic, assign) BOOL youStarred;
@property (nonatomic, copy) NSArray* reposters;
@property (nonatomic, copy) NSArray* starredBy;
@property (nonatomic, retain) SNPPost* repostOf;
@property (nonatomic, assign, getter=isDeleted) BOOL deleted;

@end
