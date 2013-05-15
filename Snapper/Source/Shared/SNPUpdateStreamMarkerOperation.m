//
//  SNPUpdateStreamMarkerOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPUpdateStreamMarkerOperation.h"

#import "SNPStreamMarker.h"

#import "SNPAPIUtils.h"


@implementation SNPUpdateStreamMarkerOperation

- (id)initWithPostId:(NSUInteger)postId
                name:(NSString*)name
          percentage:(NSUInteger)percentage
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.postId = postId;
        self.name = name;
        self.percentage = percentage;
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] updateStreamMarkerEndpointURL];
        self.method = @"POST";
        self.serializationRootClass = [SNPStreamMarker class];
    }

    return self;
}

- (void)main {

    NSDictionary* markerDict = (@{
                                @"name" : _name,
                                @"id" : @(_postId),
                                @"percentage" : @(_percentage),
                                });

    NSError* error = nil;
    NSData* bodyData = [NSJSONSerialization dataWithJSONObject:markerDict
                                                       options:0
                                                         error:&error];
    if(bodyData == nil) {
        SNPResponse* response = [self createResponseFromError:error];
        if(self.finishBlock) {
            self.finishBlock(response);
            return;
        }
    }

    self.body = bodyData;
    self.bodyType = @"application/json";

    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];

    if(self.parameters) {
        [parameters addEntriesFromDictionary:self.parameters];
    }

    // Reset read ID
    if(_resetReadId) {
        parameters[@"reset_read_id"] = @(_resetReadId);
    }

    if([[parameters allKeys] count]) {
        self.parameters = parameters;
    }

    [super main];
}

@end
