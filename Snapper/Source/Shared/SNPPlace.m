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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"factualId": @"factual_id",
             @"addressExtended": @"address_extended",
             @"countryCode": @"country_code",
             @"adminRegion": @"admin_region",
             @"postTown": @"post_town",
             @"POBox": @"po_box",
             @"open": @"is_open",
             };
}

+ (NSValueTransformer*)websiteJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer*)categoriesJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^(NSArray *categoriesArray) {
                NSMutableArray* categories = [NSMutableArray new];

                for(NSDictionary* categoryDict in categoriesArray) {
                    NSError* error = nil;
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:categoryDict
                                                                                  modelClass:[SNPPlaceCategory class]
                                                                                       error:&error];
                    SNPPlaceCategory* category = (SNPPlaceCategory*)[adapter model];

                    [categories addObject:category];
                }

                return [categories copy];
            }
                                                         reverseBlock:
            ^(NSArray* categoriesArray) {
                NSMutableArray* categories = [NSMutableArray new];

                for(SNPPlaceCategory* category in categoriesArray) {
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:category];
                    NSDictionary* categoryDict = [adapter JSONDictionary];

                    [categories addObject:categoryDict];
                }

                return [categories copy];
            }];
}

@end
