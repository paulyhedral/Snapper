//
//  SNPFilter.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPFilter.h"


@implementation SNPFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"filterId": @"id",
             @"matchPolicy": @"match_policy",
             };
}

+ (NSValueTransformer *)matchPolicyJSONTransformer {
    NSDictionary *policies = @{
                               @"include_any": @(SNPFilterMatchPolicyIncludeAny),
                               @"include_all": @(SNPFilterMatchPolicyIncludeAll),
                               @"exclude_any": @(SNPFilterMatchPolicyIncludeAny),
                               @"exclude_all": @(SNPFilterMatchPolicyExcludeAll),
                               };

    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSString *str) {
                return policies[str];
            }
                                                         reverseBlock:
            ^id(NSNumber *policy) {
                return [policies allKeysForObject:policy].lastObject;
            }];
}

+ (NSValueTransformer*)filterIdJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSString *strId) {
                return [NSNumber numberWithInteger:[strId integerValue]];
            }
                                                         reverseBlock:
            ^id(NSNumber* intNum) {
                return [NSString stringWithFormat:@"%ld", (long)[intNum integerValue]];
            }];
}

@end
