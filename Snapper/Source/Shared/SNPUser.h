//
//  SNPUser.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>

#import "SNPDescription.h"
#import "SNPImage.h"


@interface SNPUser : MTLModel
<MTLJSONSerializing>

@property (nonatomic, assign) NSUInteger userId;
@property (nonatomic, nonnull, copy) NSString* username;
@property (nonatomic, nullable, copy) NSString* name;
@property (nonatomic, nonnull, retain) SNPDescription* descriptionObject;
@property (nonatomic, nonnull, copy) NSString* timezone;
@property (nonatomic, nonnull, copy) NSString* locale;
@property (nonatomic, nonnull, retain) SNPImage* avatarImage;
@property (nonatomic, nonnull, retain) SNPImage* coverImage;
@property (nonatomic, nonnull, copy) NSString* type;
@property (nonatomic, nonnull, copy) NSDate* createdAt;
@property (nonatomic, assign) NSUInteger followingCount;
@property (nonatomic, assign) NSUInteger followersCount;
@property (nonatomic, assign) NSUInteger postsCount;
@property (nonatomic, assign) NSUInteger starsCount;
@property (nonatomic, assign) BOOL followsYou;
@property (nonatomic, assign) BOOL youFollow;
@property (nonatomic, assign) BOOL youMuted;
@property (nonatomic, assign) BOOL youBlocked;
@property (nonatomic, assign) BOOL youCanSubscribe;
@property (nonatomic, nullable, copy) NSArray* annotations;
@property (nonatomic, nonnull, copy) NSURL* canonicalURL;
@property (nonatomic, nullable, copy) NSString* verifiedDomain;

@end
