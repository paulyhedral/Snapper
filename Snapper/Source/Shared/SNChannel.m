//
//  SNChannel.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNChannel.h"


@implementation SNChannel

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";

    return dateFormatter;
}

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"hasUnread": @"has_unread",
            @"channelId": @"id",
            @"readersAnyUser": @"readers.any_user",
            @"readersImmutable": @"readers.immutable",
            @"readersPublic": @"readers.public",
            @"readersUserIds": @"readers.user_ids",
            @"readersYou": @"readers.you",
            @"recentMessageId": @"recent_message_id",
            @"writersAnyUser": @"writers.any_user",
            @"writersImmutable": @"writers.immutable",
            @"writersPublic": @"writers.public",
            @"writersUserIds": @"writers.user_ids",
            @"writersYou": @"writers.you",
            @"youCanEdit": @"you_can_edit",
            @"youSubscribed": @"you_subscribed",
            }];
}

+ (NSValueTransformer*)channelIdTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *strId) {
        return [NSNumber numberWithInteger:[strId integerValue]];
    }
                                                         reverseBlock:^(NSNumber* intNum) {
                                                             return [NSString stringWithFormat:@"%d", [intNum integerValue]];
                                                         }];
}

+ (NSValueTransformer*)ownerTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSDictionary* dict) {
        return [[SNUser alloc] initWithExternalRepresentation:dict];
    }
                                                         reverseBlock:^(SNUser* user) {
                                                             return [user externalRepresentation];
                                                         }];
}

@end
