//
//  SNUser.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNUser.h"


@implementation SNUser

+ (NSDateFormatter*)dateFormatter {
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";

    return dateFormatter;
}

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"userId": @"id",
            @"avatarImage": @"avatar_image",
            @"coverImage": @"cover_image",
            @"createdAt": @"created_at",
            @"followingCount": @"counts.following",
            @"followersCount": @"counts.followers",
            @"postsCount": @"counts.posts",
            @"starsCount": @"counts.stars",
            @"followsYou": @"follows_you",
            @"youFollow": @"you_follow",
            @"youMuted": @"you_muted",
            @"canonicalURL": @"canonical_url",
            }];
}

+ (NSValueTransformer*)userIdTransformer {
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

+ (NSValueTransformer*)canonicalURLTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer*)descriptionTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSDictionary* dict) {
        return [[SNDescription alloc] initWithExternalRepresentation:dict];
    }
                                                         reverseBlock:^(SNDescription* desc) {
                                                             return [desc externalRepresentation];
                                                         }];
}

+ (NSValueTransformer*)avatarImageTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSDictionary* dict) {
        return [[SNImage alloc] initWithExternalRepresentation:dict];
    }
                                                         reverseBlock:^(SNImage* image) {
                                                             return [image externalRepresentation];
                                                         }];
}

+ (NSValueTransformer*)coverImageTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSDictionary* dict) {
        return [[SNImage alloc] initWithExternalRepresentation:dict];
    }
                                                         reverseBlock:^(SNImage* image) {
                                                             return [image externalRepresentation];
                                                         }];
}

@end
