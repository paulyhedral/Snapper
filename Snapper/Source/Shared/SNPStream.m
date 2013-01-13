//
//  SNPStream.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPStream.h"


@implementation SNPStream

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"streamId": @"id",
            @"objectTypes": @"object_types",
            }];
}

+ (NSValueTransformer*)streamIdTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *strId) {
        return [NSNumber numberWithInteger:[strId integerValue]];
    }
                                                         reverseBlock:^(NSNumber* intNum) {
                                                             return [NSString stringWithFormat:@"%ld", (long)[intNum integerValue]];
                                                         }];
}

+ (NSValueTransformer *)streamTypeTransformer {
    NSDictionary *streamTypes = @{
                                  @"long_poll": @(SNPStreamTypeLongPoll),
                                  };

    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return streamTypes[str];
    }
                                                         reverseBlock:^(NSNumber *streamType) {
                                                             return [streamTypes allKeysForObject:streamType].lastObject;
                                                         }];
}

+ (NSValueTransformer*)filterTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSDictionary* dict) {
        return [[SNPFilter alloc] initWithExternalRepresentation:dict];
    }
                                                         reverseBlock:^(SNPFilter* filter) {
                                                             return [filter externalRepresentation];
                                                         }];
}

@end
