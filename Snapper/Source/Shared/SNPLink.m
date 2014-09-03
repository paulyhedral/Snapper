//
//  SNPLink.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPLink.h"


@implementation SNPLink

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
            @"URL": @"url",
            @"position": @"pos",
            @"length": @"len",
            @"amendedLength": @"amended_len",
            };
}

+ (NSValueTransformer*)URLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
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

+ (NSValueTransformer*)amendedLengthJSONTransformer {
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
