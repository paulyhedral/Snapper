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
#import "SNPAnnotation.h"


@implementation SNPPost

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
             };
}

+ (NSValueTransformer*)postIdJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^(NSString *strId) {
                return [NSNumber numberWithInteger:[strId integerValue]];
            }
                                                         reverseBlock:
            ^(NSNumber* intNum) {
                return [NSString stringWithFormat:@"%ld", (long)[intNum integerValue]];
            }];
}

+ (NSValueTransformer*)replyToJSONTransformer {
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

+ (NSValueTransformer*)canonicalURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer*)userJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^(NSDictionary* dict) {
                NSError* error = nil;
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:dict
                                                                              modelClass:[SNPUser class]
                                                                                   error:&error];
                return [adapter model];
            }
                                                         reverseBlock:
            ^(SNPUser* user) {
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:user];
                return [adapter JSONDictionary];
            }];
}

+ (NSValueTransformer*)mentionsJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSArray* mentionsDicts) {
                NSMutableArray* mentions = [NSMutableArray new];

                for(NSDictionary* mentionDict in mentionsDicts) {
                    NSError* error = nil;
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:mentionDict
                                                                                  modelClass:[SNPMention class]
                                                                                       error:&error];
                    if(adapter == nil) {
                        NSLog(@"Unable to deserialize mention: %@", error);
                    }
                    else {
                        SNPMention* mention = (SNPMention*)[adapter model];

                        [mentions addObject:mention];
                    }
                }

                return [mentions copy];
            }
                                                         reverseBlock:
            ^id(NSArray* mentions) {
                NSMutableArray* mentionsDicts = [NSMutableArray new];

                for(SNPMention* mention in mentions) {
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:mention];
                    NSDictionary* mentionDict = [adapter JSONDictionary];

                    [mentionsDicts addObject:mentionDict];
                }

                return [mentionsDicts copy];
            }];
}

+ (NSValueTransformer*)linksJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSArray* linksDicts) {
                NSMutableArray* links = [NSMutableArray new];

                for(NSDictionary* linkDict in linksDicts) {
                    NSError* error = nil;
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:linkDict
                                                                                  modelClass:[SNPLink class]
                                                                                       error:&error];
                    if(adapter == nil) {
                        NSLog(@"Unable to deserialize mention: %@", error);
                    }
                    else {
                        SNPLink* link = (SNPLink*)[adapter model];

                        [links addObject:link];
                    }
                }

                return [links copy];
            }
                                                         reverseBlock:
            ^id(NSArray* links) {
                NSMutableArray* linksDicts = [NSMutableArray new];

                for(SNPLink* link in links) {
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:link];
                    NSDictionary* linkDict = [adapter JSONDictionary];

                    [linksDicts addObject:linkDict];
                }

                return [linksDicts copy];
            }];
}

+ (NSValueTransformer*)hashtagsJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSArray* hashtagsDicts) {
                NSMutableArray* hashtags = [NSMutableArray new];

                for(NSDictionary* hashtagDict in hashtagsDicts) {
                    NSError* error = nil;
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:hashtagDict
                                                                                  modelClass:[SNPHashtag class]
                                                                                       error:&error];
                    if(adapter == nil) {
                        NSLog(@"Unable to deserialize mention: %@", error);
                    }
                    else {
                        SNPHashtag* hashtag = (SNPHashtag*)[adapter model];

                        [hashtags addObject:hashtag];
                    }
                }

                return [hashtags copy];
            }
                                                         reverseBlock:
            ^id(NSArray* hashtags) {
                NSMutableArray* hashtagsDicts = [NSMutableArray new];

                for(SNPHashtag* hashtag in hashtags) {
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:hashtag];
                    NSDictionary* hashtagDict = [adapter JSONDictionary];

                    [hashtagsDicts addObject:hashtagDict];
                }

                return [hashtagsDicts copy];
            }];
}

+ (NSValueTransformer*)repostOfJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSDictionary* dict) {
                NSError* error = nil;
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:dict
                                                                              modelClass:[SNPPost class]
                                                                                   error:&error];
                if(adapter == nil) {
                    NSLog(@"Unable to deserialize post: %@", error);
                    return nil;
                }

                return [adapter model];
            }
                                                         reverseBlock:
            ^id(SNPPost* post) {
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:post];
                return [adapter JSONDictionary];
            }];
}

+ (NSValueTransformer*)respostersJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSArray* userDicts) {
                NSMutableArray* users = [NSMutableArray new];

                for(NSDictionary* userDict in userDicts) {
                    NSError* error = nil;
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:userDict
                                                                                  modelClass:[SNPUser class]
                                                                                       error:&error];
                    if(adapter == nil) {
                        NSLog(@"Unable to deserialize user: %@", error);
                        return nil;
                    }

                    SNPUser* user = (SNPUser*)[adapter model];

                    [users addObject:user];
                }

                return [users copy];
            }
                                                         reverseBlock:
            ^id(NSArray* users) {
                NSMutableArray* userDicts = [NSMutableArray new];

                for(SNPUser* user in users) {
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:user];
                    NSDictionary* userDict = [adapter JSONDictionary];

                    [userDicts addObject:userDict];
                }

                return [userDicts copy];
            }];
}

+ (NSValueTransformer*)starredByJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSArray* userDicts) {
                NSMutableArray* users = [NSMutableArray new];

                for(NSDictionary* userDict in userDicts) {
                    NSError* error = nil;
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:userDict
                                                                                  modelClass:[SNPUser class]
                                                                                       error:&error];
                    if(adapter == nil) {
                        NSLog(@"Unable to deserialize user: %@", error);
                        return nil;
                    }

                    SNPUser* user = (SNPUser*)[adapter model];

                    [users addObject:user];
                }

                return [users copy];
            }
                                                         reverseBlock:
            ^id(NSArray* users) {
                NSMutableArray* userDicts = [NSMutableArray new];

                for(SNPUser* user in users) {
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:user];
                    NSDictionary* userDict = [adapter JSONDictionary];

                    [userDicts addObject:userDict];
                }

                return [userDicts copy];
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

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p> { postId=%ld, createdAt=%@ }",
            NSStringFromClass([self class]),
            self,
            (long)_postId,
            _createdAt];
}

@end
