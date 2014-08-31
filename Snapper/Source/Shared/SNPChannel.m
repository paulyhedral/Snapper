//
//  SNPChannel.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPChannel.h"

#import "SNPAnnotation.h"


@implementation SNPChannel

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

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"hasUnread": @"has_unread",
             @"channelId": @"id",
             @"recentMessageId": @"recent_message_id",
             @"youCanEdit": @"you_can_edit",
             @"youSubscribed": @"you_subscribed",
             @"youMuted": @"you_muted",
             @"recentMessage": @"recent_message",
             @"subscriberCount": @"counts.subscribers",
             @"messageCount": @"counts.messages",
             @"isInactive": @"is_inactive",
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

+ (NSValueTransformer*)ownerJSONTransformer {
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

                return [adapter model];
            }
                                                         reverseBlock:
            ^id(SNPUser* user) {
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:user];
                return [adapter JSONDictionary];
            }];
}

+ (NSValueTransformer*)readersJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSDictionary* dict) {
                NSError* error = nil;
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:dict
                                                                              modelClass:[SNPACL class]
                                                                                   error:&error];
                if(adapter == nil) {
                    NSLog(@"Unable to deserialize readers ACL: %@", error);
                    return nil;
                }

                return [adapter model];
            }
                                                         reverseBlock:
            ^id(SNPACL* acl) {
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:acl];
                return [adapter JSONDictionary];
            }];
}

+ (NSValueTransformer*)writersJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSDictionary* dict) {
                NSError* error = nil;
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:dict
                                                                              modelClass:[SNPACL class]
                                                                                   error:&error];
                if(adapter == nil) {
                    NSLog(@"Unable to deserialize writers ACL: %@", error);
                    return nil;
                }

                return [adapter model];
            }
                                                         reverseBlock:
            ^id(SNPACL* acl) {
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:acl];
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
                        NSLog(@"Unable to deserialize annotation: %@", error);
                        return nil;
                    }

                    SNPAnnotation* annotation = (SNPAnnotation*)[adapter model];

                    [annotations addObject:annotation];
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

+ (NSValueTransformer*)recentMessageJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSDictionary* messageDict) {
                NSError* error = nil;
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:messageDict
                                                                              modelClass:[SNPMessage class]
                                                                                   error:&error];
                if(adapter == nil) {
                    NSLog(@"Error while deserializing recent message: %@", error);
                    return nil;
                }

                return [adapter model];
            }
                                                         reverseBlock:
            ^id(SNPMessage* message) {
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:message];
                return [adapter JSONDictionary];
            }];
}

@end
