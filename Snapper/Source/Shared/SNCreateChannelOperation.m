//
//  SNCreateChannelOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNCreateChannelOperation.h"

#import "SNAnnotation.h"
#import "SNUser.h"

#import "SNAPIUtils.h"


@implementation SNCreateChannelOperation

- (id)initWithType:(NSString*)type
           readers:(NSArray*)readers
           writers:(NSArray*)writers
       annotations:(NSArray*)annotations
         accountId:(NSString*)accountId
       finishBlock:(void (^)(SNResponse*))finishBlock {

    self = [super init];
    if(self) {
        self.endpoint = [[SNAPIUtils sharedAPIUtils] createChannelEndpointURL];
        self.type = type;
        self.readers = readers;
        self.writers = writers;
        self.annotations = annotations;
        self.bodyType = @"application/json";
        self.accountId = accountId;
        self.finishBlock = finishBlock;
    }
}

- (void)main {

    NSMutableDictionary* body = [NSMutableDictionary new];

    body[@"type"] = _type;

    // TODO: readers
    body[@"readers"] = readersDict;

    // TODO: writers
    body[@"writers"] = writersDict;

    NSMutableArray* serializedAnnotations = [NSMutableArray new];
    for(SNAnnotation* annotation in _annotations) {
        NSDictionary* annotationDict = [annotation externalRepresentation];
        [serializedAnnotations addObject:annotationDict];

    }
    body[@"annotations"] = serializedAnnotations;

    NSError* error = nil;
    NSData* bodyData = [NSJSONSerialization dataWithJSONObject:body
                                                       options:0
                                                         error:&error];
    if(bodyData == nil) {
        SNResponse* response = [self createResponseFromError:error];
        self.finishBlock(response);
        return;
    }

    self.method = @"POST";
    self.body = bodyData;
    
    [super main];
}

@end
