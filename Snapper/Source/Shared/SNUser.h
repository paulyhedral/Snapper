//
//  SNUser.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>

#import "SNDescription.h"
#import "SNImage.h"


@interface SNUser : MTLModel

@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, copy) NSString* username;
@property (nonatomic, retain) SNDescription* description;
@property (nonatomic, copy) NSString* timezone;
@property (nonatomic, copy) NSString* locale;
@property (nonatomic, retain) SNImage* avatarImage;
@property (nonatomic, retain) SNImage* coverImage;
@property (nonatomic, copy) NSString* type;
@property (nonatomic, copy) NSDate* createdAt;
@property (nonatomic, assign) NSInteger followingCount;
@property (nonatomic, assign) NSInteger followersCount;
@property (nonatomic, assign) NSInteger postsCount;
@property (nonatomic, assign) NSInteger starsCount;
@property (nonatomic, assign) BOOL followsYou;
@property (nonatomic, assign) BOOL youFollow;
@property (nonatomic, assign) BOOL youMuted;
@property (nonatomic, retain) NSArray* annotations;
@property (nonatomic, retain) NSURL* canonicalURL;

@end
