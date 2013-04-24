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

    // readers
    body[@"readers"] = [_readers externalRepresentation];

    // writers
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

    [self handleChannelParameters];
    
    [super main];
}

@synthesize channelTypes = _channelTypes;
@synthesize includeMarker = _includeMarker;
@synthesize includeRead = _includeRead;
@synthesize includeRecentMessage = _includeRecentMessage;
@synthesize includeMessageAnnotations = _includeMessageAnnotations;

- (void)handleChannelParameters {

    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];

    if(self.parameters) {
        [parameters addEntriesFromDictionary:self.parameters];
    }

    if(_channelTypes) {
        parameters[@"channel_types"] = [_channelTypes componentsJoinedByString:@","];
    }
    if(_includeMarker) {
        parameters[@"include_marker"] = @"1";
    }
    if(_includeRead) {
        parameters[@"include_read"] = @"1";
    }
    if(_includeRecentMessage) {
        parameters[@"include_recent_message"] = @"1";
    }
    if(_includeMessageAnnotations) {
        parameters[@"include_message_annotations"] = @"1";
    }

    if([[parameters allKeys] count]) {
        self.parameters = parameters;
    }
}

@end
