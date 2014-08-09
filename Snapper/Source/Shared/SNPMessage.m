//
//  SNPMessage.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPMessage.h"
#import "SNPAnnotation.h"


@implementation SNPMessage

+ (NSDateFormatter *)dateFormatter {
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
             @"messageId": @"id",
             @"channelId": @"channel_id",
             @"createdAt": @"created_at",
             @"sourceName": @"source.name",
             @"sourceLink": @"source.link",
             @"sourceClientId": @"source.client_id",
             @"machineOnly": @"machine_only",
             @"threadId": @"thread_id",
             @"numReplies": @"num_replies",
             @"mentions": @"entities.mentions",
             @"hashtags": @"entities.hashtags",
             @"links": @"entities.links",
             };
}

+ (NSValueTransformer*)channelIdJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^(NSString *strId) {
                return [NSNumber numberWithInteger:[strId integerValue]];
            }
                                                         reverseBlock:
            ^(NSNumber* intNum) {
                return [NSString stringWithFormat:@"%ld", (long)[intNum integerValue]];
            }];
}

+ (NSValueTransformer*)messageIdJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^(NSString *strId) {
                return [NSNumber numberWithInteger:[strId integerValue]];
            }
                                                         reverseBlock:
            ^(NSNumber* intNum) {
                return [NSString stringWithFormat:@"%ld", (long)[intNum integerValue]];
            }];
}

+ (NSValueTransformer*)threadIdJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^(NSString *strId) {
                return [NSNumber numberWithInteger:[strId integerValue]];
            }
                                                         reverseBlock:
            ^(NSNumber* intNum) {
                return [NSString stringWithFormat:@"%ld", (long)[intNum integerValue]];
            }];
}

+ (NSValueTransformer*)createdAtJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^(NSString *str) {
                return [self.dateFormatter dateFromString:str];
            }
                                                         reverseBlock:
            ^(NSDate *date) {
                return [self.dateFormatter stringFromDate:date];
            }];
}

+ (NSValueTransformer*)userJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSDictionary* dict) {
                NSError* error = nil;
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:dict
                                                                              modelClass:[SNPUser class]
                                                                                   error:&error];
                if(adapter == nil) {
                    NSLog(@"Unable to deserialize user: %@", error);
                    return nil;
                }
                else {
                    return [adapter model];
                }
            }
                                                         reverseBlock:
            ^id(SNPUser* user) {
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:user];
                return [adapter JSONDictionary];
            }];
}

+ (NSValueTransformer*)annotationsJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSArray* annotationDicts) {
                NSMutableArray* annotations = [NSMutableArray new];

                for(NSDictionary* annoDict in annotationDicts) {
                    NSError* error = nil;
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:annoDict
                                                                                  modelClass:[SNPAnnotation class]
                                                                                       error:&error];
                    if(adapter == nil) {
                        NSLog(@"Unable to deserialize mention: %@", error);
                    }
                    else {
                        SNPAnnotation* annotation = (SNPAnnotation*)[adapter model];

                        [annotations addObject:annotation];
                    }
                }

                return [annotations copy];
            }
                                                         reverseBlock:
            ^id(NSArray* annotations) {
                NSMutableArray* annoDicts = [NSMutableArray new];

                for(SNPAnnotation* annotation in annotations) {
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:annotation];
                    NSDictionary* annoDict = [adapter JSONDictionary];

                    [annoDicts addObject:annoDict];
                }

                return [annoDicts copy];
            }];
}

@end
