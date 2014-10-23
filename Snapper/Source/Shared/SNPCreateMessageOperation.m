//
//  SNPCreateMessageOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPCreateMessageOperation.h"

#import "SNPMessage.h"
#import "SNPResponse.h"
#import "SNPAnnotation.h"
#import "SNPEntity.h"
#import "SNPMention.h"
#import "SNPLink.h"
#import "SNPHashtag.h"
#import "SNPPost.h"

#import "SNPAPIUtils.h"


@implementation SNPCreateMessageOperation

#pragma mark - Initialization

- (instancetype)initWithChannelId:(NSUInteger)channelId
                   text:(NSString*)text
                replyTo:(NSUInteger)replyTo
            machineOnly:(BOOL)machineOnly
            annotations:(NSArray*)annotations
               entities:(NSArray*)entities
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.channelId = channelId;
        self.text = text;
        self.replyTo = replyTo;
        self.machineOnly = machineOnly;
        self.annotations = annotations;
        self.entities = entities;
        self.serializationRootClass = [SNPMessage class];
    }

    return self;
}

- (instancetype)initWithDestinations:(NSArray*)userIds
                      text:(NSString*)text
               annotations:(NSArray*)annotations
                  entities:(NSArray*)entities
                 accountId:(NSString*)accountId
               finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.destinations = userIds;
        self.text = text;
        self.annotations = annotations;
        self.entities = entities;
        self.serializationRootClass = [SNPMessage class];
    }

    return self;
}

- (instancetype)initWithChannelId:(NSUInteger)channelId
                             text:(NSString*)text
                          replyTo:(NSUInteger)replyTo
                      machineOnly:(BOOL)machineOnly
                      annotations:(NSArray*)annotations
                         entities:(NSArray*)entities
                       parseLinks:(BOOL)parseLinks
                    parseMarkdown:(BOOL)parseMarkdown
                        accountId:(NSString*)accountId
                      finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.channelId = channelId;
        self.text = text;
        self.replyTo = replyTo;
        self.machineOnly = machineOnly;
        self.annotations = annotations;
        self.entities = entities;
        self.parseLinks = parseLinks;
        self.parseMarkdown = parseMarkdown;
        self.serializationRootClass = [SNPMessage class];
    }

    return self;
}

- (instancetype)initWithDestinations:(NSArray*)userIds
                                text:(NSString*)text
                         annotations:(NSArray*)annotations
                            entities:(NSArray*)entities
                          parseLinks:(BOOL)parseLinks
                       parseMarkdown:(BOOL)parseMarkdown
                           accountId:(NSString*)accountId
                         finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.destinations = userIds;
        self.text = text;
        self.annotations = annotations;
        self.entities = entities;
        self.parseLinks = parseLinks;
        self.parseMarkdown = parseMarkdown;
        self.serializationRootClass = [SNPMessage class];
    }

    return self;
}


#pragma mark - The workhorse

- (void)main {

    if(_channelId == 0) {
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] createPMMessageEndpointURL];
    }
    else {
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] createMessageEndpointURL:_channelId];
    }
    self.method = @"POST";

    NSMutableDictionary* postDict = [NSMutableDictionary new];
    if([_text length]) {
        postDict[@"text"] = _text;
    }
    if([_destinations count] > 0) {
        postDict[@"destinations"] = [_destinations copy];
    }
    if(_replyTo > 0) {
        postDict[@"reply_to"] = @(_replyTo);
    }
    if(_machineOnly) {
        if([_text length]) {
            NSLog(@"Cannot set 'machine_only' on a message with body text!");
        }
        else {
            postDict[@"machine_only"] = @YES;
        }
    }
    if(_annotations) {
        NSMutableArray* serializedAnnotations = [NSMutableArray new];
        for(SNPAnnotation* annotation in _annotations) {
            MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:annotation];
            NSDictionary* annotationDict = [adapter JSONDictionary];
            [serializedAnnotations addObject:annotationDict];
        }
        postDict[@"annotations"] = serializedAnnotations;
    }
    if(_entities) {
        NSMutableArray* serializedHashtags = [NSMutableArray new];
        NSMutableArray* serializedLinks = [NSMutableArray new];
        NSMutableArray* serializedMentions = [NSMutableArray new];
        for(SNPEntity* entity in _entities) {
            MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:entity];
            NSDictionary* entityDict = [adapter JSONDictionary];

            if([entity isKindOfClass:[SNPLink class]]) {
                [serializedLinks addObject:entityDict];
            }
            else if([entity isKindOfClass:[SNPMention class]]) {
                [serializedMentions addObject:entityDict];
            }
            else if([entity isKindOfClass:[SNPHashtag class]]) {
                [serializedHashtags addObject:entityDict];
            }
        }

        if([serializedHashtags count] ||
           [serializedLinks count] ||
           [serializedMentions count]) {
            NSMutableDictionary* entitiesDict = [NSMutableDictionary new];

            if([serializedMentions count]) {
                entitiesDict[@"mentions"] = serializedMentions;
            }
            if([serializedLinks count]) {
                entitiesDict[@"links"] = serializedLinks;
            }
            if([serializedHashtags count]) {
                entitiesDict[@"hashtags"] = serializedHashtags;
            }

            if(_parseLinks) {
                entitiesDict[@"parse_links"] = @YES;
            }
            if(_parseMarkdown) {
                entitiesDict[@"parse_markdown_links"] = @YES;
            }

            postDict[@"entities"] = entitiesDict;
        }
    }

    NSError* error = nil;
    NSData* postBody = [NSJSONSerialization dataWithJSONObject:postDict
                                                       options:0
                                                         error:&error];
    if(postBody == nil) {
        NSLog(@"Unable to instantiate 'create message operation': %@", [error localizedDescription]);
        SNPResponse* response = [self createResponseFromError:error];
        self.finishBlock(response);
        return;
    }

    self.body = postBody;
    self.bodyType = @"application/json";
    
    [super main];
}

@end
