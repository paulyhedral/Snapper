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

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"mimeType": @"mime_type",
            @"URL": @"url",
            @"URLExpires": @"url_expires",
            @"imageWidth": @"image_info.width",
            @"imageHeight": @"image_info.height",
            }];
}

+ (NSValueTransformer*)URLTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer*)URLExpiresTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return [self.dateFormatter dateFromString:str];
    }
                                                         reverseBlock:^(NSDate *date) {
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

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"fileId": @"id",
            @"derivedFiles": @"derived_files",
            @"fileToken": @"file_token",
            @"mimeType": @"mime_type",
            @"totalSize": @"total_size",
            @"URL": @"url",
            @"URLExpires": @"url_expires",
            @"imageWidth": @"image_info.width",
            @"imageHeight": @"image_info.height",
            }];
}

+ (NSValueTransformer*)fileIdTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *strId) {
        return [NSNumber numberWithInteger:[strId integerValue]];
    }
                                                         reverseBlock:^(NSNumber* intNum) {
                                                             return [NSString stringWithFormat:@"%ld", (long)[intNum integerValue]];
                                                         }];
}

+ (NSValueTransformer*)derivedFilesTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSDictionary *dict) {
        NSMutableDictionary* filesDict = [NSMutableDictionary new];

        NSArray* keys = [dict allKeys];
        for(NSString* key in keys) {
            NSDictionary* valueDict = dict[key];
            SNPDerivedFile* derivedFile = [[SNPDerivedFile alloc] initWithExternalRepresentation:valueDict];

            filesDict[key] = derivedFile;
        }

        return [filesDict copy];
    }
                                                         reverseBlock:^(NSDictionary* dict) {
                                                             NSMutableDictionary* extDict = [NSMutableDictionary new];

                                                             NSArray* keys = [dict allKeys];
                                                             for(NSString* key in keys) {
                                                                 SNPDerivedFile* derivedFile = dict[key];
                                                                 NSDictionary* valueDict = [derivedFile externalRepresentation];

                                                                 extDict[key] = valueDict;
                                                             }

                                                             return [extDict copy];
                                                         }];
}

+ (NSValueTransformer*)kindTransformer {
    NSDictionary *fileKinds = @{
                                @"image": @(SNPFileKindImage),
                                @"other": @(SNPFileKindOther),
                                };

    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return fileKinds[str];
    }
                                                         reverseBlock:^(NSNumber *fileKind) {
                                                             return [fileKinds allKeysForObject:fileKind].lastObject;
                                                         }];
}

+ (NSValueTransformer*)sourceTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSDictionary* dict) {
        return [[SNPSource alloc] initWithExternalRepresentation:dict];
    }
                                                         reverseBlock:^(SNPSource* source) {
                                                             return [source externalRepresentation];
                                                         }];
}

+ (NSValueTransformer*)URLTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer*)URLExpiresTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return [self.dateFormatter dateFromString:str];
    }
                                                         reverseBlock:^(NSDate *date) {
                                                             return [self.dateFormatter stringFromDate:date];
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
