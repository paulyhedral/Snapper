//
//  SNGetRepostersOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNGetRepostersOperation.h"

#import "SNAPIUtils.h"


@implementation SNGetRepostersOperation

#pragma mark - Initialization

- (id)initWithPostId:(NSUInteger)postId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNResponse*))finishBlock {

    self = [super init];
    if(self) {
        self.postId = postId;
        self.accountId = accountId;
        self.finishBlock = finishBlock;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNAPIUtils sharedAPIUtils] getRepostersEndpointURL:_postId];

    [super main];
}

@end
