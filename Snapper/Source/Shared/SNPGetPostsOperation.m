//
//  SNPGetPostsOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetPostsOperation.h"

#import "SNPPost.h"

#import "SNPAPIUtils.h"


@implementation SNPGetPostsOperation

#pragma mark - Initialization

- (instancetype)initWithPostIds:(NSArray*)postIds
            accountId:(NSString*)accountId
          finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.postIds = postIds;
        self.endpoint = [[SNPAPIUtils sharedInstance] getPostsEndpointURL];
        self.serializationArrayClass = [SNPPost class];
}

    return self;
}


#pragma mark - Workhorse

- (void)main {

    NSString* postIdsString = [_postIds componentsJoinedByString:@","];
    self.parameters = (@{
                       @"ids" : postIdsString,
                       });

    [super main];
}

@end
