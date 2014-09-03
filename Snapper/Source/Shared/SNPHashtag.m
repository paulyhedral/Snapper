//
//  SNPHashtag.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPHashtag.h"


@implementation SNPHashtag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
            @"position": @"pos",
            @"length": @"len",
            };
}

+ (NSValueTransformer*)positionJSONTransformer {
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

+ (NSValueTransformer*)lengthJSONTransformer {
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
