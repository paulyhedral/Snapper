//
//  SNPMention.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPMention.h"


@implementation SNPMention

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
            @"userId": @"id",
            @"position": @"pos",
            @"length": @"len",
            @"leading": @"is_leading",
            };
}

@end
