//
//  SNPMention.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPMention.h"


@implementation SNPMention

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"userId": @"id",
            @"position": @"pos",
            @"length": @"len",
            @"leading": @"is_leading",
            }];
}

@end
