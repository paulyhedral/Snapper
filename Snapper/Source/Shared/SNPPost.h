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
@property (nonatomic, nonnull, retain) SNPUser* user;
@property (nonatomic, nonnull, copy) NSDate* createdAt;
@property (nonatomic, nonnull, copy) NSString* text;
@property (nonatomic, nonnull, copy) NSString* html;
@property (nonatomic, nonnull, copy) NSString* sourceName;
@property (nonatomic, nonnull, copy) NSString* sourceLink;
@property (nonatomic, nonnull, copy) NSString* sourceClientId;
@property (nonatomic, assign, getter=isMachineOnly) BOOL machineOnly;
@property (nonatomic, assign) NSUInteger replyTo;
@property (nonatomic, assign) NSUInteger threadId;
@property (nonatomic, nonnull, copy) NSURL* canonicalURL;
@property (nonatomic, assign) NSUInteger numReplies;
@property (nonatomic, assign) NSUInteger numReposts;
@property (nonatomic, assign) NSUInteger numStars;
@property (nonatomic, nullable, copy) NSArray* annotations;
@property (nonatomic, nullable, copy) NSArray* mentions;
@property (nonatomic, nullable, copy) NSArray* hashtags;
@property (nonatomic, nullable, copy) NSArray* links;
@property (nonatomic, assign) BOOL youReposted;
@property (nonatomic, assign) BOOL youStarred;
@property (nonatomic, nullable, copy) NSArray* reposters;
@property (nonatomic, nullable, copy) NSArray* starredBy;
@property (nonatomic, nullable, retain) SNPPost* repostOf;
@property (nonatomic, assign, getter=isDeleted) BOOL deleted;

@end
