//
//  SNPSource.m
//  Snapper
//
//  Created by Paul Schifferer on 1/28/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPSource.h"


@implementation SNPSource

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
            @"clientId": @"client_id",
            };
}

@end
