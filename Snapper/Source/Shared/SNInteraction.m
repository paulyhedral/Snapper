//
//  SNInteraction.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNInteraction.h"


@implementation SNInteraction

+ (NSValueTransformer*)actionTransformer {
    NSDictionary* actionTypes = @{
                                  @"follow": @(SNInteractionActionFollow),
                                  @"reply": @(SNInteractionActionReply),
                                  @"repost": @(SNInteractionActionRepost),
                                  @"star": @(SNInteractionActionStar),
                                  };

    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return actionTypes[str];
    }
                                                         reverseBlock:^(NSNumber* actionType) {
                                                             return [actionTypes allKeysForObject:actionType].lastObject;
                                                         }];
}

@end
