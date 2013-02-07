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

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"mentions": @"entities.mentions",
            @"hashtags": @"entities.hashtags",
            @"links": @"entities.links",
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

@end
