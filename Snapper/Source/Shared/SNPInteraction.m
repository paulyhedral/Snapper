//
//  SNPInteraction.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPInteraction.h"


@implementation SNPInteraction

+ (NSValueTransformer*)actionTransformer {
    NSDictionary* actionTypes = @{
                                  @"follow": @(SNPInteractionActionFollow),
                                  @"reply": @(SNPInteractionActionReply),
                                  @"repost": @(SNPInteractionActionRepost),
                                  @"star": @(SNPInteractionActionStar),
                                  };

    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return actionTypes[str];
    }
                                                         reverseBlock:^(NSNumber* actionType) {
                                                             return [actionTypes allKeysForObject:actionType].lastObject;
                                                         }];
}

@end
