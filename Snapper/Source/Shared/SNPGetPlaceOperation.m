//
//  SNPGetPlaceOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 2/5/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPGetPlaceOperation.h"

#import "SNPPlace.h"

#import "SNPAPIUtils.h"


@implementation SNPGetPlaceOperation

- (instancetype)initWithFactualId:(NSString*)factualId
                            token:(NSString*)token
                      finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithFinishBlock:finishBlock];
    if(self) {
        self.factualId = factualId;
        self.token = token;
        self.endpoint = [[SNPAPIUtils sharedInstance] getPlaceEndpointURL:factualId];
        self.headers = (@{
                          @"Authorization" : [NSString stringWithFormat:@"Bearer %@", token],
                          });
        self.serializationRootClass = [SNPPlace class];
    }
    
    return self;
}

@end
