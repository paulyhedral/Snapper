//
//  SNPUpdateUserOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPUpdateUserOperation.h"

#import "SNPUser.h"
#import "SNPAnnotation.h"
#import "SNPEntity.h"
#import "SNPMention.h"
#import "SNPLink.h"
#import "SNPHashtag.h"

#import "SNPAPIUtils.h"


@implementation SNPUpdateUserOperation

#pragma mark - Initializers

- (nonnull instancetype)initWithName:(nonnull NSString*)fullName
                      locale:(nonnull NSString*)locale
                    timezone:(nonnull NSString*)timezone
                 description:(nonnull NSString*)descriptionText
                   accountId:(nonnull NSString*)accountId
                 finishBlock:(nonnull void (^)(nonnull SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.fullName = fullName;
        self.locale = locale;
        self.timezone = timezone;
        self.descriptionText = descriptionText;
        self.endpoint = [[SNPAPIUtils sharedInstance] updateUserEndpointURL];
        self.method = @"PUT";
        self.serializationRootClass = [SNPUser class];
        self.bodyType = @"application/json";
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    NSMutableDictionary* userDict = [NSMutableDictionary new];

    userDict[@"name"] = self.fullName;
    userDict[@"locale"] = _locale;
    userDict[@"timezone"] = _timezone;

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
