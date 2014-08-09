//
//  SNPStreamMarker.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPStreamMarker.h"


@implementation SNPStreamMarker

+ (NSDateFormatter*)dateFormatter {
    static NSDateFormatter* dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        dateFormatter.dateFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'";
        dateFormatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    });

    return dateFormatter;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"postId": @"id",
             @"updatedAt": @"updated_at",
             };
}

+ (NSValueTransformer*)postIdJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^(NSString *strId) {
                return [NSNumber numberWithInteger:[strId integerValue]];
            }
                                                         reverseBlock:
            ^(NSNumber* intNum) {
                return [NSString stringWithFormat:@"%ld", (long)[intNum integerValue]];
            }];
}

+ (NSValueTransformer*)updatedAtJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^(NSString *str) {
                return [self.dateFormatter dateFromString:str];
            }
                                                         reverseBlock:
            ^(NSDate *date) {
                return [self.dateFormatter stringFromDate:date];
            }];
}

@end
