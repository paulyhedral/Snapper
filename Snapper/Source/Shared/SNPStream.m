//
//  SNPStream.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPStream.h"


@implementation SNPStream

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"streamId": @"id",
             @"objectTypes": @"object_types",
             };
}

+ (NSValueTransformer*)streamIdJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^(NSString *strId) {
                return [NSNumber numberWithInteger:[strId integerValue]];
            }
                                                         reverseBlock:
            ^(NSNumber* intNum) {
                return [NSString stringWithFormat:@"%ld", (long)[intNum integerValue]];
            }];
}

+ (NSValueTransformer *)streamTypeJSONTransformer {
    NSDictionary *streamTypes = @{
                                  @"long_poll": @(SNPStreamTypeLongPoll),
                                  };

    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^(NSString *str) {
                return streamTypes[str];
            }
                                                         reverseBlock:
            ^(NSNumber *streamType) {
                return [streamTypes allKeysForObject:streamType].lastObject;
            }];
}

+ (NSValueTransformer*)filterJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSDictionary* dict) {
                NSError* error = nil;
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:dict
                                                                              modelClass:[SNPFilter class]
                                                                                   error:&error];
                if(adapter == nil) {
                    NSLog(@"Unable to deserialize filter: %@", error);
                    return nil;
                }

                return [adapter model];
            }
                                                         reverseBlock:
            ^id(SNPFilter* filter) {
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:filter];
                return [adapter JSONDictionary];
            }];
}

@end
