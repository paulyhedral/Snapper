//
//  SNPDescription.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPDescription.h"


@implementation SNPDescription

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"mentions": @"entities.mentions",
            @"hashtags": @"entities.hashtags",
            @"links": @"entities.links",
            }];
}

@end
