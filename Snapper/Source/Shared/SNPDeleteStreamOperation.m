//
//  SNPDeleteStreamOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/23/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPDeleteStreamOperation.h"

#import "SNPStream.h"

#import "SNPAPIUtils.h"


@implementation SNPDeleteStreamOperation

- (instancetype)initWithStreamId:(NSUInteger)streamId
              appToken:(NSString*)appToken
           finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAppToken:appToken
                       finishBlock:finishBlock];
    if(self) {
        self.streamId = streamId;
        self.endpoint = [[SNPAPIUtils sharedInstance] getStreamEndpointURL:streamId];
        self.method = @"DELETE";
        self.serializationRootClass = [SNPStream class];
    }

    return self;
}

@end
