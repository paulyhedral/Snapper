//
//  SNPToken.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>

#import "SNPUser.h"


@interface SNPToken : MTLModel
<MTLJSONSerializing>

@property (nonatomic, nonnull, copy) NSString* clientId;
@property (nonatomic, nonnull, copy) NSString* appClientId;
@property (nonatomic, nonnull, copy) NSString* appLink;
@property (nonatomic, nonnull, copy) NSString* appName;
@property (nonatomic, nonnull, copy) NSArray* scopes;
@property (nonatomic, nonnull, retain) SNPUser* user;
@property (nonatomic, assign) NSUInteger storageAvailable;
@property (nonatomic, assign) NSUInteger storageUsed;

@end
