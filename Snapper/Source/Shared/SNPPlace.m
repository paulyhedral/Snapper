//
//  SNPPlace.m
//  Snapper
//
//  Created by Paul Schifferer on 2/5/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPPlace.h"

#import "SNPPlaceCategory.h"


@implementation SNPPlace

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"factualId": @"factual_id",
            @"addressExtended": @"address_extended",
            @"countryCode": @"country_code",
            @"adminRegion": @"admin_region",
            @"postTown": @"post_town",
            @"POBox": @"po_box",
            @"open": @"is_open",
            }];
}

+ (NSValueTransformer*)websiteTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer*)categoriesTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSArray *categoriesArray) {
        NSMutableArray* categories = [NSMutableArray new];

        for(NSDictionary* categoryDict in categoriesArray) {
            SNPPlaceCategory* category = [[SNPPlaceCategory alloc] initWithExternalRepresentation:categoryDict];

            [categories addObject:category];
        }

        return [categories copy];
    }
                                                         reverseBlock:^(NSArray* categoriesArray) {
                                                             NSMutableArray* categories = [NSMutableArray new];

                                                             for(SNPPlaceCategory* category in categoriesArray) {
                                                                 NSDictionary* categoryDict = [category externalRepresentation];

                                                                 [categories addObject:categoryDict];
                                                             }

                                                             return [categories copy];
                                                         }];
}

@end
