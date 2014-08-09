//
//  SNPFilterClause.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPFilterClause.h"


@implementation SNPFilterClause

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"objectType": @"object_type",
             @"op": @"operator",
             };
}

+ (NSValueTransformer *)objectTypeJSONTransformer {
    NSDictionary *objectTypes = @{
                                  @"post": @(SNPFilterClauseObjectTypePost),
                                  @"star": @(SNPFilterClauseObjectTypeStar),
                                  @"user_follow": @(SNPFilterClauseObjectTypeUserFollow),
                                  @"stream_marker": @(SNPFilterClauseObjectTypeStreamMarker),
                                  @"message": @(SNPFilterClauseObjectTypeMessage),
                                  @"channel": @(SNPFilterClauseObjectTypeChannel),
                                  @"channel_subscription": @(SNPFilterClauseObjectTypeChannelSubscription),
                                  };

    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSString *str) {
                return objectTypes[str];
            }
                                                         reverseBlock:
            ^id(NSNumber *objectType) {
                return [objectTypes allKeysForObject:objectType].lastObject;
            }];
}

+ (NSValueTransformer *)opJSONTransformer {
    NSDictionary *operators = @{
                                @"equals": @(SNPFilterClauseOperatorEquals),
                                @"matches": @(SNPFilterClauseOperatorMatches),
                                @"lt": @(SNPFilterClauseOperatorLessThan),
                                @"le": @(SNPFilterClauseOperatorLessThanOrEqual),
                                @"gt": @(SNPFilterClauseOperatorGreaterThan),
                                @"ge": @(SNPFilterClauseOperatorGreaterThanOrEqual),
                                @"one_of": @(SNPFilterClauseOperatorOneOf),
                                };

    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSString *str) {
                return operators[str];
            }
                                                         reverseBlock:
            ^id(NSNumber *op) {
                return [operators allKeysForObject:op].lastObject;
            }];
}

+ (NSValueTransformer *)valueJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(id value) {
                return value;
            }
                                                         reverseBlock:
            ^id(id value) {
                return value;
            }];
}

@end
