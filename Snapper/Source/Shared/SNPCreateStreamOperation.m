//
//  SNPCreateStreamOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/23/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPCreateStreamOperation.h"

#import "SNPAPIUtils.h"


@implementation SNPCreateStreamOperation

#pragma mark - Initialization

- (instancetype)initWithObjectTypes:(NSArray*)objectTypes
                     type:(SNPStreamType)type
                 filterId:(NSUInteger)filterId
                      key:(NSString*)key
                 appToken:(NSString*)appToken
              finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithAppToken:appToken
                       finishBlock:finishBlock];
    if(self) {
        self.objectTypes = objectTypes;
        self.type = type;
        self.filterId = filterId;
        self.key = key;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] createStreamEndpointURL];
    self.method = @"POST";

    NSString* type = nil;
    switch(_type) {
        case SNPStreamTypeLongPoll:
            type = @"long_poll";
            break;
    }

    NSMutableDictionary* streamDict = [(@{
                                        @"object_type" : _objectTypes,
                                        @"type" : type,
                                        }) mutableCopy];

    if(_filterId > 0) {
        streamDict[@"filter_id"] = @(_filterId);
    }
    if(_key) {
        streamDict[@"key"] = _key;
    }

    NSError* error = nil;
    NSData* body = [NSJSONSerialization dataWithJSONObject:streamDict
                                                   options:0
                                                     error:&error];
    if(body == nil) {
        SNPResponse* response = [self createResponseFromError:error];
        self.finishBlock(response);
        return;
    }

    self.body = body;
    self.bodyType = @"application/json";

    self.serializationRootClass = [SNPStream class];
    
    [super main];
}

@end
