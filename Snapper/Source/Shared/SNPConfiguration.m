//
//  SNPConfiguration.m
//  Snapper
//
//  Created by Paul Schifferer on 8/13/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPConfiguration.h"


@implementation SNPConfiguration

+ (NSDictionary *)externalRepresentationKeyPathsByPropertyKey {
    return [super.externalRepresentationKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
            @"textUriTemplateLengthPostId": @"text.uri_template_length.post_id",
            @"textUriTemplateLengthMessageId": @"text.uri_template_length.message_id",
            @"userAnnotationMaxBytes": @"user.annotation_max_bytes",
            @"userTextMaxLength": @"user.text_max_length",
            @"fileAnnotationMaxBytes": @"file.annotation_max_bytes",
            @"postAnnotationMaxBytes": @"post.annotation_max_bytes",
            @"postTextMaxLength": @"post.text_max_length",
            @"messageAnnotationMaxBytes": @"message.annotation_max_bytes",
            @"messageTextMaxLength": @"message.text_max_length",
            @"channelAnnotationMaxBytes": @"channel.annotation_max_bytes",
            }];
}

@end
