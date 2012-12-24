//
//  SNFilter.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNFilter.h"


@implementation SNFilter

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"filterId": @"id",
            @"matchPolicy": @"match_policy",
            }];
}

+ (NSValueTransformer *)matchPolicyTransformer {
    NSDictionary *policies = @{
                             @"include_any": @(SNFilterMatchPolicyIncludeAny),
                             @"include_all": @(SNFilterMatchPolicyIncludeAll),
                             @"exclude_any": @(SNFilterMatchPolicyIncludeAny),
                             @"exclude_all": @(SNFilterMatchPolicyExcludeAll),
                             };

    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return policies[str];
    }
                                                         reverseBlock:^(NSNumber *policy) {
        return [policies allKeysForObject:policy].lastObject;
    }];
}

+ (NSValueTransformer*)filterIdTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *strId) {
        return [NSNumber numberWithInteger:[strId integerValue]];
    }
                                                         reverseBlock:^(NSNumber* intNum) {
                                                             return [NSString stringWithFormat:@"%ld", (long)[intNum integerValue]];
                                                         }];
}

@end
