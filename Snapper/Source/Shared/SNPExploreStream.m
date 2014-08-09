//
//  SNPExploreStream.m
//  Snapper
//
//  Created by Paul Schifferer on 3/9/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPExploreStream.h"


@implementation SNPExploreStream

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
            @"URL": @"url",
            @"exploreDescription": @"description",
            };
}

+ (NSValueTransformer*)URLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
