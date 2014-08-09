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
@property (nonatomic, assign) BOOL immutable;
@property (nonatomic, assign) BOOL anyUser;
@property (nonatomic, assign) BOOL public_;
@property (nonatomic, retain) NSArray* userIds;
@property (nonatomic, assign) BOOL you;

@end
