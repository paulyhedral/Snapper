//
//  SNACL.m
//  Snapper
//
//  Created by Paul Schifferer on 12/23/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNACL.h"


@implementation SNACL

+ (NSDictionary*)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"anyUser": @"any_user",
            @"public_": @"public",
            @"userIds": @"user_ids",
            }];
}

@end
