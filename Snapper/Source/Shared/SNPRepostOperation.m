//
//  SNPRepostOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPRepostOperation.h"

#import "SNPPost.h"

#import "SNPAPIUtils.h"


@implementation SNPRepostOperation

#pragma mark - Initialization

- (id)initWithPostId:(NSUInteger)postId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.postId = postId;
        self.method = @"POST";
        self.serializationRootClass = [SNPPost class];
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] repostEndpointURL:_postId];

    [super main];
}

@end
