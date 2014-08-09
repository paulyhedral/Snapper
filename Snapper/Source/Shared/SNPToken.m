//
//  SNPToken.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPToken.h"


@implementation SNPToken

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"clientId": @"client_id",
             @"appClientId": @"app.client_id",
             @"appLink": @"app.link",
             @"appName": @"app.name",
             @"storageAvailable": @"storage.available",
             @"storageUsed": @"storage.used",
             };
}

+ (NSValueTransformer*)userJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSDictionary* dict) {
                NSError* error = nil;
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:dict
                                                                              modelClass:[SNPUser class]
                                                                                   error:&error];
                if(adapter == nil) {
                    NSLog(@"Unable to deserialize user: %@", error);
                    return nil;
                }

                return [adapter model];
            }
                                                         reverseBlock:
            ^id(SNPUser* user) {
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:user];
                return [adapter JSONDictionary];
            }];
}

@end
