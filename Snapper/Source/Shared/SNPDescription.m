//
//  SNPDescription.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPDescription.h"

#import "SNPHashtag.h"
#import "SNPMention.h"
#import "SNPLink.h"


@implementation SNPDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"mentions": @"entities.mentions",
             @"hashtags": @"entities.hashtags",
             @"links": @"entities.links",
             };
}

+ (NSValueTransformer*)mentionsJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^(NSArray* mentionsDicts) {
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
            ^(NSArray* mentions) {
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

@end
