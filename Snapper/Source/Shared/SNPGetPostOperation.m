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

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.postId = postId;
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] getPostEndpointURL:postId];
        self.serializationRootClass = [SNPPost class];
    }

    return self;
}

@end
