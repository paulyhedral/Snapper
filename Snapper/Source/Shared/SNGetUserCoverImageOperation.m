//
//  SNGetUserCoverImageOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNGetUserCoverImageOperation.h"

#import "SNAPIUtils.h"


@implementation SNGetUserCoverImageOperation

- (id)initWithUserId:(NSInteger)userId
         finishBlock:(void (^)(id, NSError*))finishBlock {

    self = [super init];
    if(self) {
        self.userId = userId;
        self.finishBlock = finishBlock;
    }

    return self;
}

- (void)main {

    self.imageURL = [[SNAPIUtils sharedAPIUtils] getUserCoverImageEndpointURL:_userId];

    [super main];
}

@end
