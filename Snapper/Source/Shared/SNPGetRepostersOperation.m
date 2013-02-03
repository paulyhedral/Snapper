//
//  SNPGetRepostersOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetRepostersOperation.h"

#import "SNPUser.h"

#import "SNPAPIUtils.h"


@implementation SNPGetRepostersOperation

#pragma mark - Initialization

- (id)initWithPostId:(NSUInteger)postId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.postId = postId;
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] getRepostersEndpointURL:postId];
        self.serializationArrayClass = [SNPUser class];
    }

    return self;
}

@end
