//
//  SNPLink.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPLink.h"


@implementation SNPLink

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"URL": @"url",
            @"position": @"pos",
            @"length": @"len",
            @"amendedLength": @"amended_len",
            }];
}

+ (NSValueTransformer*)URLTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
