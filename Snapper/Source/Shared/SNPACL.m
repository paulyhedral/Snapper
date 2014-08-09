//
//  SNPACL.m
//  Snapper
//
//  Created by Paul Schifferer on 12/23/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPACL.h"


@implementation SNPACL

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
            @"anyUser": @"any_user",
            @"public_": @"public",
            @"userIds": @"user_ids",
            };
}

@end
