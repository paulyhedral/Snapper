//
//  SNUpdateStreamMarkerOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNUpdateStreamMarkerOperation.h"

#import "SNStreamMarker.h"

#import "SNAPIUtils.h"


@implementation SNUpdateStreamMarkerOperation

- (id)initWithPostId:(NSUInteger)postId
                name:(NSString*)name
          percentage:(NSUInteger)percentage
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNResponse*))finishBlock {

    self = [super init];
    if(self) {
        self.postId = postId;
        self.name = name;
        self.percentage = percentage;
        self.accountId = accountId;
        self.finishBlock = finishBlock;
    }

    return self;
}

- (void)main {

    self.endpoint = [[SNAPIUtils sharedAPIUtils] updateStreamMarkerEndpointURL];

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
        SNResponse* response = [self createResponseFromError:error];
        if(self.finishBlock) {
            self.finishBlock(response);
            return;
        }
    }

    self.body = bodyData;
    self.bodyType = @"application/json";

    self.serializationRootClass = [SNStreamMarker class];
    
    [super main];
}

@end
