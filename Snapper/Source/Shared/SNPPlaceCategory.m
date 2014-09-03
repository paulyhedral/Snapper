//
//  SNPPlaceCategory.m
//  Snapper
//
//  Created by Paul Schifferer on 2/5/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPPlaceCategory.h"


@implementation SNPPlaceCategory

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"categoryId": @"id",
             };
}

+ (NSValueTransformer*)categoryIdJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^(NSString *strId) {
                NSNumberFormatter* formatter = [NSNumberFormatter new];
                return @([[formatter numberFromString:strId] longLongValue]);
            }
                                                         reverseBlock:
            ^(NSNumber* intNum) {
                return [NSString stringWithFormat:@"%lld", [intNum longLongValue]];
            }];
}

@end
