//
//  SNPFilter.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPFilter.h"


@implementation SNPFilter

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"filterId": @"id",
            @"matchPolicy": @"match_policy",
            }];
}

+ (NSValueTransformer *)matchPolicyTransformer {
    NSDictionary *policies = @{
                             @"include_any": @(SNPFilterMatchPolicyIncludeAny),
                             @"include_all": @(SNPFilterMatchPolicyIncludeAll),
                             @"exclude_any": @(SNPFilterMatchPolicyIncludeAny),
                             @"exclude_all": @(SNPFilterMatchPolicyExcludeAll),
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
