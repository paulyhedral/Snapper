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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"eventDate": @"event_date",
             };
}

+ (NSValueTransformer*)actionJSONTransformer {
    NSDictionary* actionTypes = @{
                                  @"follow": @(SNPInteractionActionFollow),
                                  @"reply": @(SNPInteractionActionReply),
                                  @"repost": @(SNPInteractionActionRepost),
                                  @"star": @(SNPInteractionActionStar),
                                  @"welcome": @(SNPInteractionActionWelcome),
                                  @"broadcast_create": @(SNPInteractionActionBroadcastCreate),
                                  @"broadcast_subscribe": @(SNPInteractionActionBroadcastSubscribe),
                                  @"broadcast_unsubscribe": @(SNPInteractionActionBroadcastUnsubscribe),
                                  };

    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSString *str) {
                return actionTypes[str];
            }
                                                         reverseBlock:
            ^id(NSNumber* actionType) {
                return [actionTypes allKeysForObject:actionType].lastObject;
            }];
}

+ (NSValueTransformer*)eventDateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSString *str) {
                return [self.dateFormatter dateFromString:str];
            }
                                                         reverseBlock:
            ^id(NSDate *date) {
                return [self.dateFormatter stringFromDate:date];
            }];
}

@end
