//
//  SNPGetPostOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetPostOperation.h"

#import "SNPPost.h"

#import "SNPAPIUtils.h"
#import "SNPConstants.h"


@implementation SNPGetPostOperation

#pragma mark - Initialization

- (id)initWithPostId:(NSUInteger)postId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse*))finishBlock {

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

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] getPostEndpointURL:_postId];
    self.serializationRootClass = [SNPPost class];

    [super main];
}

@end
