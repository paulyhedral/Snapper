//
//  SNPInteraction.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPInteraction.h"


@implementation SNPInteraction

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

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
                                                                                                            @"eventDate": @"event_date",
                                                                                                            }];
}

+ (NSValueTransformer*)actionTransformer {
    NSDictionary* actionTypes = @{
                                  @"follow": @(SNPInteractionActionFollow),
                                  @"reply": @(SNPInteractionActionReply),
                                  @"repost": @(SNPInteractionActionRepost),
                                  @"star": @(SNPInteractionActionStar),
                                  };

    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return actionTypes[str];
    }
                                                         reverseBlock:^(NSNumber* actionType) {
                                                             return [actionTypes allKeysForObject:actionType].lastObject;
                                                         }];
}

+ (NSValueTransformer*)eventDateTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return [self.dateFormatter dateFromString:str];
    }
                                                         reverseBlock:^(NSDate *date) {
                                                             return [self.dateFormatter stringFromDate:date];
                                                         }];
}

@end
