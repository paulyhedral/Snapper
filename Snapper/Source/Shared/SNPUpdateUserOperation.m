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

#import "SNPAPIUtils.h"


@implementation SNPUpdateUserOperation

#pragma mark - Initializers

- (id)initWithName:(NSString*)name
            locale:(NSString*)locale
          timezone:(NSString*)timezone
       description:(NSString*)description
         accountId:(NSString*)accountId
       finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super init];
    if(self) {
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] updateUserEndpointURL];
        self.name = name;
        self.locale = locale;
        self.timezone = timezone;
        self.description = description;
        self.accountId = accountId;
        self.finishBlock = finishBlock;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    NSMutableDictionary* userDict = [NSMutableDictionary new];

    userDict[@"name"] = _name;
    userDict[@"locale"] = _locale;
    userDict[@"timezone"] = _timezone;

    NSMutableDictionary* descriptionDict = [NSMutableDictionary new];
    descriptionDict[@"text"] = _description;
    if(_descriptionEntities) {
        NSMutableArray* serializedEntities = [NSMutableArray new];

        for(SNPEntity* entity in _descriptionEntities) {
            NSDictionary* entityDict = [entity externalRepresentation];
            [serializedEntities addObject:entityDict];
        }

        descriptionDict[@"entities"] = serializedEntities;
    }
    userDict[@"description"] = descriptionDict;

    if(_annotations) {
        NSMutableArray* serializedAnnotations = [NSMutableArray new];

        for(SNPAnnotation* annotation in _annotations) {
            NSDictionary* annotationDict = [annotation externalRepresentation];
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
    self.bodyType = @"application/json";
    self.method = @"PUT";
    self.serializationRootClass = [SNPUser class];

    [super main];
}

@end
