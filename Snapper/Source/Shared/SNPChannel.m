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

+ (NSDictionary*)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"hasUnread": @"has_unread",
            @"channelId": @"id",
            @"recentMessageId": @"recent_message_id",
            @"youCanEdit": @"you_can_edit",
            @"youSubscribed": @"you_subscribed",
            }];
}

+ (NSValueTransformer*)channelIdTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *strId) {
        return [NSNumber numberWithInteger:[strId integerValue]];
    }
                                                         reverseBlock:^(NSNumber* intNum) {
                                                             return [NSString stringWithFormat:@"%ld", (long)[intNum integerValue]];
                                                         }];
}

+ (NSValueTransformer*)ownerTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSDictionary* dict) {
        return [[SNPUser alloc] initWithExternalRepresentation:dict];
    }
                                                         reverseBlock:^(SNPUser* user) {
                                                             return [user externalRepresentation];
                                                         }];
}

+ (NSValueTransformer*)readersTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSDictionary* dict) {
        return [[SNPACL alloc] initWithExternalRepresentation:dict];
    }
                                                         reverseBlock:^(SNPACL* acl) {
                                                             return [acl externalRepresentation];
                                                         }];
}

+ (NSValueTransformer*)writersTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSDictionary* dict) {
        return [[SNPACL alloc] initWithExternalRepresentation:dict];
    }
                                                         reverseBlock:^(SNPACL* acl) {
                                                             return [acl externalRepresentation];
                                                         }];
}

+ (NSValueTransformer*)annotationsTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSArray* annotationDicts) {
        NSMutableArray* annotations = [NSMutableArray new];

        for(NSDictionary* annoDict in annotationDicts) {
            SNPAnnotation* annotation = [[SNPAnnotation alloc] initWithExternalRepresentation:annoDict];

            [annotations addObject:annotation];
        }

        return [annotations copy];
    }
                                                         reverseBlock:^(NSArray* annotations) {
                                                             NSMutableArray* annoDicts = [NSMutableArray new];

                                                             for(SNPAnnotation* annotation in annotations) {
                                                                 NSDictionary* annoDict = [annotation externalRepresentation];

                                                                 [annoDicts addObject:annoDict];
                                                             }

                                                             return [annoDicts copy];
                                                         }];
}

@end
