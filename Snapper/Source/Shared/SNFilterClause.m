//
//  SNFilterClause.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNFilterClause.h"


@implementation SNFilterClause

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"objectType": @"object_type",
            @"op": @"operator",
            }];
}

+ (NSValueTransformer *)objectTypeTransformer {
    NSDictionary *objectTypes = @{
                                  @"post": @(SNFilterClauseObjectTypePost),
                                  @"star": @(SNFilterClauseObjectTypeStar),
                                  @"user_follow": @(SNFilterClauseObjectTypeUserFollow),
                                  @"stream_marker": @(SNFilterClauseObjectTypeStreamMarker),
                                  @"message": @(SNFilterClauseObjectTypeMessage),
                                  @"channel": @(SNFilterClauseObjectTypeChannel),
                                  @"channel_subscription": @(SNFilterClauseObjectTypeChannelSubscription),
                                  };

    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return objectTypes[str];
    }
                                                         reverseBlock:^(NSNumber *objectType) {
                                                             return [objectTypes allKeysForObject:objectType].lastObject;
                                                         }];
}

+ (NSValueTransformer *)opTransformer {
    NSDictionary *operators = @{
                                @"equals": @(SNFilterClauseOperatorEquals),
                                @"matches": @(SNFilterClauseOperatorMatches),
                                @"lt": @(SNFilterClauseOperatorLessThan),
                                @"le": @(SNFilterClauseOperatorLessThanOrEqual),
                                @"gt": @(SNFilterClauseOperatorGreaterThan),
                                @"ge": @(SNFilterClauseOperatorGreaterThanOrEqual),
                                @"one_of": @(SNFilterClauseOperatorOneOf),
                                };

    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return operators[str];
    }
                                                         reverseBlock:^(NSNumber *op) {
                                                             return [operators allKeysForObject:op].lastObject;
                                                         }];
}

+ (NSValueTransformer *)valueTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(id value) {
        return value;
    }
                                                         reverseBlock:^(id value) {
                                                             return value;
                                                         }];
}

@end
