//
//  SNPGetUserCoverImageOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetUserCoverImageOperation.h"

#import "SNPAPIUtils.h"


@implementation SNPGetUserCoverImageOperation

- (id)initWithUserId:(NSInteger)userId
         finishBlock:(void (^)(id, NSError*))finishBlock {

    self = [super init];
    if(self) {
        self.userId = userId;
        self.imageURL = [[SNPAPIUtils sharedAPIUtils] getUserCoverImageEndpointURL:userId];
        self.finishBlock = finishBlock;
    }

    return self;
}

@end
