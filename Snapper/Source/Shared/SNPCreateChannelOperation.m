//
//  SNPCreateChannelOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPCreateChannelOperation.h"

#import "SNPChannel.h"
#import "SNPAnnotation.h"
#import "SNPUser.h"

#import "SNPAPIUtils.h"


@implementation SNPCreateChannelOperation

#pragma mark - Initialization

- (id)initWithType:(NSString*)type
           readers:(SNPACL*)readers
           writers:(SNPACL*)writers
       annotations:(NSArray*)annotations
         accountId:(NSString*)accountId
       finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] createChannelEndpointURL];
        self.type = type;
        self.readers = readers;
        self.writers = writers;
        self.annotations = annotations;
        self.bodyType = @"application/json";
        self.serializationRootClass = [SNPChannel class];
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    NSMutableDictionary* body = [NSMutableDictionary new];

    body[@"type"] = _type;

    // TODO: readers
    body[@"readers"] = [_readers externalRepresentation];

    // TODO: writers
    body[@"writers"] = [_writers externalRepresentation];

    NSMutableArray* serializedAnnotations = [NSMutableArray new];
    for(SNPAnnotation* annotation in _annotations) {
        NSDictionary* annotationDict = [annotation externalRepresentation];
        [serializedAnnotations addObject:annotationDict];

    }
    body[@"annotations"] = serializedAnnotations;

    NSError* error = nil;
    NSData* bodyData = [NSJSONSerialization dataWithJSONObject:body
                                                       options:0
                                                         error:&error];
    if(bodyData == nil) {
        SNPResponse* response = [self createResponseFromError:error];
        self.finishBlock(response);
        return;
    }

    self.method = @"POST";
    self.body = bodyData;
    
    [super main];
}

@end
