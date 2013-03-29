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
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";

    return dateFormatter;
}

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
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

+ (NSValueTransformer*)messageIdTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *strId) {
        return [NSNumber numberWithInteger:[strId integerValue]];
    }
                                                         reverseBlock:^(NSNumber* intNum) {
                                                             return [NSString stringWithFormat:@"%ld", (long)[intNum integerValue]];
                                                         }];
}

+ (NSValueTransformer*)threadIdTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *strId) {
        return [NSNumber numberWithInteger:[strId integerValue]];
    }
                                                         reverseBlock:^(NSNumber* intNum) {
                                                             return [NSString stringWithFormat:@"%ld", (long)[intNum integerValue]];
                                                         }];
}

+ (NSValueTransformer*)createdAtTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return [self.dateFormatter dateFromString:str];
    }
                                                         reverseBlock:^(NSDate *date) {
                                                             return [self.dateFormatter stringFromDate:date];
                                                         }];
}

+ (NSValueTransformer*)userTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSDictionary* dict) {
        return [[SNPUser alloc] initWithExternalRepresentation:dict];
    }
                                                         reverseBlock:^(SNPUser* user) {
                                                             return [user externalRepresentation];
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
