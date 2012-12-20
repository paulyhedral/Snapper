//
//  SNStream.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNStream.h"


@implementation SNStream

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
                                                             return [NSString stringWithFormat:@"%d", [intNum integerValue]];
                                                         }];
}

+ (NSValueTransformer *)streamTypeTransformer {
    NSDictionary *streamTypes = @{
    @"long_poll": @(SNStreamTypeLongPoll),
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
        return [[SNFilter alloc] initWithExternalRepresentation:dict];
    }
                                                         reverseBlock:^(SNFilter* filter) {
                                                             return [filter externalRepresentation];
                                                         }];
}

@end
