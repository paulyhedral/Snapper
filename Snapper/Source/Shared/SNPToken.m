//
//  SNPToken.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPToken.h"


@implementation SNPToken

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"clientId": @"client_id",
            @"appClientId": @"app.client_id",
            @"appLink": @"app.link",
            @"appName": @"app.name",
            }];
}

+ (NSValueTransformer*)userTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSDictionary* dict) {
        return [[SNPUser alloc] initWithExternalRepresentation:dict];
    }
                                                         reverseBlock:^(SNPUser* user) {
                                                             return [user externalRepresentation];
                                                         }];
}

@end
