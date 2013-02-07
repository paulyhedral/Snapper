//
//  SNPProcessTextOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 2/6/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPProcessTextOperation.h"

#import "SNPDescription.h"

#import "SNPAPIUtils.h"


@implementation SNPProcessTextOperation

- (id)initWithText:(NSString*)text
             token:(NSString*)token
       finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithFinishBlock:finishBlock];
    if(self) {
        self.text = text;
        self.token = token;
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] processTextEndpointURL];
        self.method = @"POST";
        self.headers = (@{
                        @"Authorization" : [NSString stringWithFormat:@"Bearer %@", token],
                        });
        self.bodyType = @"text/plain";
        self.body = [text dataUsingEncoding:NSUTF8StringEncoding];
        self.serializationRootClass = [SNPDescription class];
    }

    return self;
}

@end
