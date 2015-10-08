//
//  SNPACL.h
//  Snapper
//
//  Created by Paul Schifferer on 12/23/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>


@interface SNPACL : MTLModel
<MTLJSONSerializing>

// -- Properties --
@property (nonatomic, assign, getter=isImmutable) BOOL immutable;
@property (nonatomic, assign) BOOL anyUser;
@property (nonatomic, assign, getter=isPublic) BOOL public_;
@property (nonatomic, nonnull, copy) NSArray* userIds;
@property (nonatomic, assign, getter=isYou) BOOL you;

@end
