//
//  SNGetPostOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNGetPostOperation.h"

#import "SNPost.h"

#import "SNAPIUtils.h"
#import "SNConstants.h"


@implementation SNGetPostOperation

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


#pragma mark - Workhorses

- (void)main {

    self.endpoint = [[SNAPIUtils sharedAPIUtils] getPostEndpointURL:_postId];
    self.serializationRootClass = [SNPost class];

    [super main];
}

@end
