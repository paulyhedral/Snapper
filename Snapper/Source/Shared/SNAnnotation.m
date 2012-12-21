//
//  SNAnnotation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNAnnotation.h"


@implementation SNAnnotation

+ (NSValueTransformer*)valueTransformer {
    return [MTLValueTransformer reversibleTransformerWithBlock:^ id (id value) {
        return value;
    }];
}

@end
