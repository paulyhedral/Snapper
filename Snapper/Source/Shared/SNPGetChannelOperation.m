//
//  SNPGetChannelOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetChannelOperation.h"

#import "SNPChannel.h"

#import "SNPAPIUtils.h"


@implementation SNPGetChannelOperation

- (id)initWithChannelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.channelId = channelId;
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] getChannelEndpointURL:_channelId];
        self.serializationRootClass = [SNPChannel class];
    }

    return self;
}

- (void)main {

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
