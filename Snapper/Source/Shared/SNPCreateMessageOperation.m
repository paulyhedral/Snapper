//
//  SNPCreateMessageOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPCreateMessageOperation.h"

#import "SNPResponse.h"
#import "SNPAnnotation.h"
#import "SNPEntity.h"
#import "SNPPost.h"

#import "SNPAPIUtils.h"


@implementation SNPCreateMessageOperation

#pragma mark - Initialization

- (id)initWithChannelId:(NSUInteger)channelId
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
    }

    return self;
}


#pragma mark - The workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] createMessageEndpointURL:_channelId];
    self.method = @"POST";

    NSMutableDictionary* postDict = [NSMutableDictionary new];
    if([_text length]) {
        postDict[@"text"] = _text;
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
            NSDictionary* annotationDict = [annotation externalRepresentation];
            [serializedAnnotations addObject:annotationDict];
        }
        postDict[@"annotations"] = serializedAnnotations;
    }
    if(_entities) {
        NSMutableArray* serializedEntities = [NSMutableArray new];
        for(SNPEntity* entity in _entities) {
            NSDictionary* entityDict = [entity externalRepresentation];
            [serializedEntities addObject:entityDict];
        }
        postDict[@"entities"] = serializedEntities;
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
