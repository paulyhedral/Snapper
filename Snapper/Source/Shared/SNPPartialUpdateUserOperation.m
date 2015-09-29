//
//  SNPPartialUpdateUserOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 5/22/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPPartialUpdateUserOperation.h"

#import "SNPUser.h"
#import "SNPEntity.h"
#import "SNPDescription.h"
#import "SNPLink.h"
#import "SNPMention.h"
#import "SNPHashtag.h"
#import "SNPAnnotation.h"

#import "SNPAPIUtils.h"


@implementation SNPPartialUpdateUserOperation

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedInstance] updateUserEndpointURL];
    self.method = @"PATCH";
    self.serializationRootClass = [SNPUser class];
    self.bodyType = @"application/json";

    NSMutableDictionary* userDict = [NSMutableDictionary new];

    if(self.name) {
        userDict[@"name"] = self.name;
    }
    if(_locale) {
        userDict[@"locale"] = _locale;
    }
    if(_timezone) {
        userDict[@"timezone"] = _timezone;
    }

    if(_descriptionText) {
        NSMutableDictionary* descriptionDict = [NSMutableDictionary new];
        descriptionDict[@"text"] = _descriptionText;
        if(_descriptionEntities) {
            NSMutableArray* serializedHashtags = [NSMutableArray new];
            NSMutableArray* serializedLinks = [NSMutableArray new];
            NSMutableArray* serializedMentions = [NSMutableArray new];
            for(SNPEntity* entity in _descriptionEntities) {
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

                descriptionDict[@"entities"] = entitiesDict;
            }
        }
        userDict[@"description"] = descriptionDict;
    }

    if(_annotations) {
        NSMutableArray* serializedAnnotations = [NSMutableArray new];

        for(SNPAnnotation* annotation in _annotations) {
            MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:annotation];
            NSDictionary* annotationDict = [adapter JSONDictionary];
            [serializedAnnotations addObject:annotationDict];
        }

        userDict[@"annotations"] = serializedAnnotations;
    }

    NSError* error = nil;
    NSData* bodyData = [NSJSONSerialization dataWithJSONObject:userDict
                                                       options:0
                                                         error:&error];
    if(bodyData == nil) {
        if(self.finishBlock) {
            SNPResponse* response = [self createResponseFromError:error];
            self.finishBlock(response);
            return;
        }
    }
    
    self.body = bodyData;
    
    [super main];
}

@end
