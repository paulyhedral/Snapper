//
//  SNPFile.m
//  Snapper
//
//  Created by Paul Schifferer on 1/28/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPFile.h"


@implementation SNPDerivedFile

+ (NSDateFormatter*)dateFormatter {
    static NSDateFormatter* dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        dateFormatter.dateFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'";
        dateFormatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    });

    return dateFormatter;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"mimeType": @"mime_type",
             @"URL": @"url",
             @"URLExpires": @"url_expires",
             @"imageWidth": @"image_info.width",
             @"imageHeight": @"image_info.height",
             };
}

+ (NSValueTransformer*)URLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer*)URLExpiresJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^(NSString *str) {
                return [self.dateFormatter dateFromString:str];
            }
                                                         reverseBlock:
            ^(NSDate *date) {
                return [self.dateFormatter stringFromDate:date];
            }];
}

@end

@implementation SNPFile

+ (NSDateFormatter*)dateFormatter {
    static NSDateFormatter* dateFormatter = nil;
    if(dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    }

    return dateFormatter;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"fileId": @"id",
             @"derivedFiles": @"derived_files",
             @"fileToken": @"file_token",
             @"mimeType": @"mime_type",
             @"totalSize": @"total_size",
             @"URL": @"url",
             @"URLExpires": @"url_expires",
             @"imageWidth": @"image_info.width",
             @"imageHeight": @"image_info.height",
             };
}

+ (NSValueTransformer*)fileIdJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^(NSString *strId) {
                return [NSNumber numberWithInteger:[strId integerValue]];
            }
                                                         reverseBlock:
            ^(NSNumber* intNum) {
                return [NSString stringWithFormat:@"%ld", (long)[intNum integerValue]];
            }];
}

+ (NSValueTransformer*)derivedFilesJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^(NSDictionary *dict) {
                NSMutableDictionary* filesDict = [NSMutableDictionary new];

                NSArray* keys = [dict allKeys];
                for(NSString* key in keys) {
                    NSDictionary* valueDict = dict[key];

                    NSError* error = nil;
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:valueDict
                                                                                  modelClass:[SNPDerivedFile class]
                                                                                       error:&error];
                    if(adapter == nil) {
                        NSLog(@"Unable to deserialize mention: %@", error);
                    }
                    else {
                        SNPDerivedFile* derivedFile = (SNPDerivedFile*)[adapter model];

                        filesDict[key] = derivedFile;
                    }
                }

                return [filesDict copy];
            }
                                                         reverseBlock:
            ^(NSDictionary* dict) {
                NSMutableDictionary* extDict = [NSMutableDictionary new];

                NSArray* keys = [dict allKeys];
                for(NSString* key in keys) {
                    SNPDerivedFile* derivedFile = dict[key];
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:derivedFile];
                    NSDictionary* valueDict = [adapter JSONDictionary];

                    extDict[key] = valueDict;
                }

                return [extDict copy];
            }];
}

+ (NSValueTransformer*)kindJSONTransformer {
    NSDictionary *fileKinds = @{
                                @"image": @(SNPFileKindImage),
                                @"other": @(SNPFileKindOther),
                                };

    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^(NSString *str) {
                return fileKinds[str];
            }
                                                         reverseBlock:
            ^(NSNumber *fileKind) {
                return [fileKinds allKeysForObject:fileKind].lastObject;
            }];
}

+ (NSValueTransformer*)sourceJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSDictionary* dict) {
                NSError* error = nil;
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:dict
                                                                              modelClass:[SNPSource class]
                                                                                   error:&error];
                if(adapter == nil) {
                    NSLog(@"Unable to deserialize mention: %@", error);
                    return nil;
                }
                else {
                    return [adapter model];
                }
            }
                                                         reverseBlock:
            ^id(SNPSource* source) {
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:source];
                return [adapter model];
            }];
}

+ (NSValueTransformer*)URLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer*)URLExpiresJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSString *str) {
                return [self.dateFormatter dateFromString:str];
            }
                                                         reverseBlock:
            ^id(NSDate *date) {
                return [self.dateFormatter stringFromDate:date];
            }];
}

+ (NSValueTransformer*)userJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSDictionary* dict) {
                NSError* error = nil;
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:dict
                                                                              modelClass:[SNPUser class]
                                                                                   error:&error];
                if(adapter == nil) {
                    NSLog(@"Unable to deserialize mention: %@", error);
                    return nil;
                }
                else {
                    return [adapter model];
                }
            }
                                                         reverseBlock:
            ^id(SNPUser* user) {
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:user];
                return [adapter model];
            }];
}

@end
