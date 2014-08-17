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
             @"youBlocked": @"you_blocked",
             @"canonicalURL": @"canonical_url",
             @"youCanSubscribe": @"you_can_subscribe",
             @"descriptionObject": @"description",
             @"verifiedDomain" : @"verified_domain",
             };
}

+ (NSValueTransformer*)userIdJSONTransformer {
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

+ (NSValueTransformer*)canonicalURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer*)descriptionObjectJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSDictionary* dict) {
                if(dict) {
                    NSError* error = nil;
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:dict
                                                                                  modelClass:[SNPDescription class]
                                                                                       error:&error];
                    if(adapter == nil) {
                        NSLog(@"Unable to deserialize description: %@", error);
                        return nil;
                    }

                    return [adapter model];
                }

                return nil;
            }
                                                         reverseBlock:
            ^id(SNPDescription* desc) {
                if(desc) {
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:desc];
                    return [adapter JSONDictionary];
                }

                return nil;
            }];
}

+ (NSValueTransformer*)avatarImageJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSDictionary* dict) {
                NSError* error = nil;
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:dict
                                                                              modelClass:[SNPImage class]
                                                                                   error:&error];
                if(adapter == nil) {
                    NSLog(@"Unable to deserialize image: %@", error);
                    return nil;
                }

                return [adapter model];
            }
                                                         reverseBlock:
            ^id(SNPImage* image) {
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:image];
                return [adapter JSONDictionary];
            }];
}

+ (NSValueTransformer*)coverImageJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSDictionary* dict) {
                NSError* error = nil;
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:dict
                                                                              modelClass:[SNPImage class]
                                                                                   error:&error];
                if(adapter == nil) {
                    NSLog(@"Unable to deserialize image: %@", error);
                    return nil;
                }

                return [adapter model];
            }
                                                         reverseBlock:
            ^id(SNPImage* image) {
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:image];
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

@end
