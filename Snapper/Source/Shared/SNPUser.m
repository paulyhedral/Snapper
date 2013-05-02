//
//  SNPUser.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPUser.h"
#import "SNPAnnotation.h"


@implementation SNPUser

+ (NSDateFormatter*)dateFormatter {
    static NSDateFormatter* dateFormatter = nil;
    if(dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    }

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
            @"youCanSubscribe": @"you_can_subscribe",
            @"descriptionObject": @"description",
            @"verifiedDomain" : @"verified_domain",
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

+ (NSValueTransformer*)descriptionObjectTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSDictionary* dict) {
        return [[SNPDescription alloc] initWithExternalRepresentation:dict];
    }
                                                         reverseBlock:^(SNPDescription* desc) {
                                                             return [desc externalRepresentation];
                                                         }];
}

+ (NSValueTransformer*)avatarImageTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSDictionary* dict) {
        return [[SNPImage alloc] initWithExternalRepresentation:dict];
    }
                                                         reverseBlock:^(SNPImage* image) {
                                                             return [image externalRepresentation];
                                                         }];
}

+ (NSValueTransformer*)coverImageTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSDictionary* dict) {
        return [[SNPImage alloc] initWithExternalRepresentation:dict];
    }
                                                         reverseBlock:^(SNPImage* image) {
                                                             return [image externalRepresentation];
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
