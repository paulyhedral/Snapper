//
//  SNPBaseApplicationOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/23/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseApplicationOperation.h"


@implementation SNPBaseApplicationOperation

- (id)initWithAppToken:(NSString*)appToken
           finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super init];
    if(self) {
        self.appToken = appToken;
        self.finishBlock = finishBlock;
    }

    return self;
}

@end
