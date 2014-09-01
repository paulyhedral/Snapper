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
@property (nonatomic, assign) BOOL machineOnly;
@property (nonatomic, assign) NSUInteger replyTo;
@property (nonatomic, assign) NSUInteger threadId;
@property (nonatomic, copy) NSURL* canonicalURL;
@property (nonatomic, assign) NSUInteger numReplies;
@property (nonatomic, assign) NSUInteger numReposts;
@property (nonatomic, assign) NSUInteger numStars;
@property (nonatomic, retain) NSArray* annotations;
@property (nonatomic, retain) NSArray* mentions;
@property (nonatomic, retain) NSArray* hashtags;
@property (nonatomic, retain) NSArray* links;
@property (nonatomic, assign) BOOL youReposted;
@property (nonatomic, assign) BOOL youStarred;
@property (nonatomic, retain) NSArray* reposters;
@property (nonatomic, retain) NSArray* starredBy;
@property (nonatomic, retain) SNPPost* repostOf;
@property (nonatomic, assign) BOOL deleted;

@end
