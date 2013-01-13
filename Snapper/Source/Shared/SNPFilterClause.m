//
//  SNPFilterClause.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPFilterClause.h"


@implementation SNPFilterClause

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"objectType": @"object_type",
            @"op": @"operator",
            }];
}

+ (NSValueTransformer *)objectTypeTransformer {
    NSDictionary *objectTypes = @{
                                  @"post": @(SNPFilterClauseObjectTypePost),
                                  @"star": @(SNPFilterClauseObjectTypeStar),
                                  @"user_follow": @(SNPFilterClauseObjectTypeUserFollow),
                                  @"stream_marker": @(SNPFilterClauseObjectTypeStreamMarker),
                                  @"message": @(SNPFilterClauseObjectTypeMessage),
                                  @"channel": @(SNPFilterClauseObjectTypeChannel),
                                  @"channel_subscription": @(SNPFilterClauseObjectTypeChannelSubscription),
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
                                @"equals": @(SNPFilterClauseOperatorEquals),
                                @"matches": @(SNPFilterClauseOperatorMatches),
                                @"lt": @(SNPFilterClauseOperatorLessThan),
                                @"le": @(SNPFilterClauseOperatorLessThanOrEqual),
                                @"gt": @(SNPFilterClauseOperatorGreaterThan),
                                @"ge": @(SNPFilterClauseOperatorGreaterThanOrEqual),
                                @"one_of": @(SNPFilterClauseOperatorOneOf),
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
