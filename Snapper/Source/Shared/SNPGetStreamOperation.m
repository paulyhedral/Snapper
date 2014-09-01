//
//  SNPGetStreamOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/23/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetStreamOperation.h"

#import "SNPStream.h"

#import "SNPAPIUtils.h"


@implementation SNPGetStreamOperation

- (instancetype)initWithStreamId:(NSUInteger)streamId
              appToken:(NSString*)appToken
           finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithAppToken:appToken
                       finishBlock:finishBlock];
    if(self) {
        self.streamId = streamId;
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] getStreamEndpointURL:streamId];
        self.serializationRootClass = [SNPStream class];
    }

    return self;
}

@end
