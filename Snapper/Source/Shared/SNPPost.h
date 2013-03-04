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

@property (nonatomic, assign) NSInteger postId;
@property (nonatomic, retain) SNPUser* user;
@property (nonatomic, copy) NSDate* createdAt;
@property (nonatomic, copy) NSString* text;
@property (nonatomic, copy) NSString* html;
@property (nonatomic, copy) NSString* sourceName;
@property (nonatomic, copy) NSString* sourceLink;
@property (nonatomic, copy) NSString* sourceClientId;
@property (nonatomic, assign) BOOL machineOnly;
@property (nonatomic, assign) NSInteger replyTo;
@property (nonatomic, assign) NSInteger threadId;
@property (nonatomic, copy) NSURL* canonicalURL;
@property (nonatomic, assign) NSInteger numReplies;
@property (nonatomic, assign) NSInteger numReposts;
@property (nonatomic, assign) NSInteger numStars;
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
