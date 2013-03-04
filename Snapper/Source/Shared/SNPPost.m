//
//  SNPPost.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPPost.h"

#import "SNPHashtag.h"
#import "SNPMention.h"
#import "SNPLink.h"


@implementation SNPPost

+ (NSDateFormatter*)dateFormatter {
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";

    return dateFormatter;
}

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"postId": @"id",
            @"createdAt": @"created_at",
            @"sourceName": @"source.name",
            @"sourceLink": @"source.link",
            @"sourceClientId": @"source.client_id",
            @"machineOnly": @"machine_only",
            @"replyTo": @"reply_to",
            @"threadId": @"thread_id",
            @"canonicalURL": @"canonical_url",
            @"numReplies": @"num_replies",
            @"numReposts": @"num_reposts",
            @"numStars": @"num_stars",
            @"mentions": @"entities.mentions",
            @"hashtags": @"entities.hashtags",
            @"links": @"entities.links",
            @"youReposted": @"you_reposted",
            @"youStarred": @"you_starred",
            @"starredBy": @"starred_by",
            @"repostOf": @"repost_of",
            @"deleted": @"is_deleted",
            }];
}

+ (NSValueTransformer*)postIdTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *strId) {
        return [NSNumber numberWithInteger:[strId integerValue]];
    }
                                                         reverseBlock:^(NSNumber* intNum) {
                                                             return [NSString stringWithFormat:@"%ld", (long)[intNum integerValue]];
                                                         }];
}

+ (NSValueTransformer*)replyToTransformer {
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

+ (NSValueTransformer*)canonicalURLTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer*)userTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSDictionary* dict) {
        return [[SNPUser alloc] initWithExternalRepresentation:dict];
    }
                                                         reverseBlock:^(SNPUser* user) {
                                                             return [user externalRepresentation];
                                                         }];
}

+ (NSValueTransformer*)mentionsTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSArray* mentionsDicts) {
        NSMutableArray* mentions = [NSMutableArray new];

        for(NSDictionary* mentionDict in mentionsDicts) {
            SNPMention* mention = [[SNPMention alloc] initWithExternalRepresentation:mentionDict];

            [mentions addObject:mention];
        }

        return [mentions copy];
    }
                                                         reverseBlock:^(NSArray* mentions) {
                                                             NSMutableArray* mentionsDicts = [NSMutableArray new];

                                                             for(SNPMention* mention in mentions) {
                                                                 NSDictionary* mentionDict = [mention externalRepresentation];

                                                                 [mentionsDicts addObject:mentionDict];
                                                             }

                                                             return [mentionsDicts copy];
                                                         }];
}

+ (NSValueTransformer*)linksTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSArray* linksDicts) {
        NSMutableArray* links = [NSMutableArray new];

        for(NSDictionary* linkDict in linksDicts) {
            SNPLink* link = [[SNPLink alloc] initWithExternalRepresentation:linkDict];

            [links addObject:link];
        }

        return [links copy];
    }
                                                         reverseBlock:^(NSArray* links) {
                                                             NSMutableArray* linksDicts = [NSMutableArray new];

                                                             for(SNPLink* link in links) {
                                                                 NSDictionary* linkDict = [link externalRepresentation];

                                                                 [linksDicts addObject:linkDict];
                                                             }

                                                             return [linksDicts copy];
                                                         }];
}

+ (NSValueTransformer*)hashtagsTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSArray* hashtagsDicts) {
        NSMutableArray* hashtags = [NSMutableArray new];

        for(NSDictionary* hashtagDict in hashtagsDicts) {
            SNPHashtag* hashtag = [[SNPHashtag alloc] initWithExternalRepresentation:hashtagDict];

            [hashtags addObject:hashtag];
        }

        return [hashtags copy];
    }
                                                         reverseBlock:^(NSArray* hashtags) {
                                                             NSMutableArray* hashtagsDicts = [NSMutableArray new];

                                                             for(SNPHashtag* hashtag in hashtags) {
                                                                 NSDictionary* hashtagDict = [hashtag externalRepresentation];
                                                                 
                                                                 [hashtagsDicts addObject:hashtagDict];
                                                             }
                                                             
                                                             return [hashtagsDicts copy];
                                                         }];
}

+ (NSValueTransformer*)repostOfTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSDictionary* dict) {
        return [[SNPPost alloc] initWithExternalRepresentation:dict];
    }
                                                         reverseBlock:^(SNPPost* post) {
                                                             return [post externalRepresentation];
                                                         }];
}

+ (NSValueTransformer*)respostersTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSArray* userDicts) {
        NSMutableArray* users = [NSMutableArray new];

        for(NSDictionary* userDict in userDicts) {
            SNPUser* user = [[SNPUser alloc] initWithExternalRepresentation:userDict];

            [users addObject:user];
        }

        return [users copy];
    }
                                                         reverseBlock:^(NSArray* users) {
                                                             NSMutableArray* userDicts = [NSMutableArray new];

                                                             for(SNPUser* user in users) {
                                                                 NSDictionary* userDict = [user externalRepresentation];

                                                                 [userDicts addObject:userDict];
                                                             }

                                                             return [userDicts copy];
                                                         }];
}

+ (NSValueTransformer*)starredByTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSArray* userDicts) {
        NSMutableArray* users = [NSMutableArray new];

        for(NSDictionary* userDict in userDicts) {
            SNPUser* user = [[SNPUser alloc] initWithExternalRepresentation:userDict];

            [users addObject:user];
        }

        return [users copy];
    }
                                                         reverseBlock:^(NSArray* users) {
                                                             NSMutableArray* userDicts = [NSMutableArray new];

                                                             for(SNPUser* user in users) {
                                                                 NSDictionary* userDict = [user externalRepresentation];

                                                                 [userDicts addObject:userDict];
                                                             }
                                                             
                                                             return [userDicts copy];
                                                         }];
}

@end
