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

@property (nonatomic, copy) NSString* clientId;
@property (nonatomic, copy) NSString* appClientId;
@property (nonatomic, copy) NSString* appLink;
@property (nonatomic, copy) NSString* appName;
@property (nonatomic, copy) NSArray* scopes;
@property (nonatomic, retain) SNPUser* user;
@property (nonatomic, assign) NSUInteger storageAvailable;
@property (nonatomic, assign) NSUInteger storageUsed;

@end
