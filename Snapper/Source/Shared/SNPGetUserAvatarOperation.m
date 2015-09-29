//
//  SNPGetUserAvatarOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetUserAvatarOperation.h"

#import "SNPAPIUtils.h"


@implementation SNPGetUserAvatarOperation

- (instancetype)initWithUserId:(NSUInteger)userId
         finishBlock:(void (^)(id, NSError*))finishBlock {

    self = [super init];
    if(self) {
        self.userId = userId;
        self.imageURL = [[SNPAPIUtils sharedInstance] getUserAvatarEndpointURL:userId];
        self.finishBlock = finishBlock;
    }

    return self;
}

@end
