//
//  SNPSearchOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 8/13/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPSearchOperation.h"

#import "SNPPost.h"

#import "SNPAPIUtils.h"


@implementation SNPSearchOperation

#pragma mark - Initializers

- (instancetype)initWithQuery:(NSString*)query
                    accountId:(NSString*)accountId
                  finishBlock:(void (^)(SNPResponse* response))finishBlock {
    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.index = SNP_SEARCH_INDEX_COMPLETE;
        self.query = query;
    }

    return self;
}

- (instancetype)initWithText:(NSString*)text
                   accountId:(NSString*)accountId
                 finishBlock:(void (^)(SNPResponse* response))finishBlock {
    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.index = SNP_SEARCH_INDEX_COMPLETE;
        self.text = text;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] searchEndpointURL];
    self.serializationArrayClass = [SNPPost class];

    NSMutableDictionary* params = [NSMutableDictionary new];

    if(self.index) {
        params[@"index"] = self.index;
    }
    if(self.order) {
        params[@"order"] = self.order;
    }
    if(self.query) {
        params[@"query"] = self.query;
    }
    if(self.text) {
        params[@"text"] = self.text;
    }
    if(self.hashtags) {
        params[@"hashtags"] = self.hashtags;
    }
    if(self.links) {
        params[@"links"] = self.links;
    }
    if(self.linkDomains) {
        params[@"link_domains"] = self.linkDomains;
    }
    if(self.mentions) {
        params[@"mentions"] = self.mentions;
    }
    if(self.leadingMentions) {
        params[@"leading_mentions"] = self.leadingMentions;
    }
    if(self.annotationTypes) {
        params[@"annotation_types"] = self.annotationTypes;
    }
    if(self.attachmentTypes) {
        params[@"attachment_types"] = self.attachmentTypes;
    }
    if(self.crosspostURL) {
        params[@"crosspost_url"] = self.crosspostURL;
    }
    if(self.crosspostDomain) {
        params[@"crosspost_domain"] = self.crosspostDomain;
    }
    if(self.placeId) {
        params[@"place_id"] = self.placeId;
    }
    if(self.reply) {
        params[@"is_reply"] = @"1";
    }
    if(self.directed) {
        params[@"is_directed"] = @"1";
    }
    if(self.hasLocation) {
        params[@"has_location"] = @"1";
    }
    if(self.hasCheckin) {
        params[@"has_checkin"] = @"1";
    }
    if(self.crosspost) {
        params[@"is_crosspost"] = @"1";
    }
    if(self.hasAttachment) {
        params[@"has_attachment"] = @"1";
    }
    if(self.hasOembedPhoto) {
        params[@"has_oembed_photo"] = @"1";
    }
    if(self.hasOembedVideo) {
        params[@"has_oembed_video"] = @"1";
    }
    if(self.hasOembedHtml5Video) {
        params[@"has_oembed_html5_video"] = @"1";
    }
    if(self.hasOembedRich) {
        params[@"has_oembed_rich"] = @"1";
    }
    if(self.language) {
        params[@"language"] = self.language;
    }
    if(self.clientId) {
        params[@"client_id"] = self.clientId;
    }
    if(self.creatorId > 0) {
        params[@"creator_id"] = [NSString stringWithFormat:@"%ld", (long)self.creatorId];
    }
    if(self.replyTo > 0) {
        params[@"reply_to"] = [NSString stringWithFormat:@"%ld", (long)self.replyTo];
    }
    if(self.threadId > 0) {
        params[@"thread_id"] = [NSString stringWithFormat:@"%ld", (long)self.threadId];
    }

    self.parameters = [params copy];

    [super main];
}

@end
