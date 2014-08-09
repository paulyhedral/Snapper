//
//  SNPAnnotation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPAnnotation.h"


@implementation SNPAnnotation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{

             };
}

+ (NSValueTransformer*)valueJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithBlock:
            ^(id value) {
        return value;
    }];
}

@end
