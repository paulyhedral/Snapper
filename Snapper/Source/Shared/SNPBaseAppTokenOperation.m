//
//  SNPBaseAppTokenOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/23/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseAppTokenOperation.h"


@implementation SNPBaseAppTokenOperation

- (instancetype)initWithAppToken:(NSString*)appToken
                     finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithFinishBlock:finishBlock];
    if(self) {
        self.appToken = appToken;
    }

    return self;
}

@end
