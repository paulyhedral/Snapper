//
//  SNPUpdateChannelOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPUpdateChannelOperation.h"

#import "SNPChannel.h"

#import "SNPAPIUtils.h"


@implementation SNPUpdateChannelOperation

#pragma mark - Initialization

- (id)initWithChannelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.channelId = channelId;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] updateChannelEndpointURL:_channelId];
    self.method = @"POST";

    SNPChannel* channel = [SNPChannel new];

    channel.annotations = _annotations;
    channel.readers = _readers;
    channel.writers = _writers;

    NSDictionary* channelDict = [channel externalRepresentation];
    NSError* error = nil;
    NSData* bodyData = [NSJSONSerialization dataWithJSONObject:channelDict
                                                       options:0
                                                         error:&error];
    if(bodyData == nil) {
        SNPResponse* response = [self createResponseFromError:error];
        self.finishBlock(response);
        return;
    }

    self.body = bodyData;
    self.bodyType = @"application/json";

    self.serializationRootClass = [SNPChannel class];

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
