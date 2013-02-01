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

- (id)initWithPostIds:(NSArray*)postIds
            accountId:(NSString*)accountId
          finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.postIds = postIds;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] getPostsEndpointURL];

    NSString* postIdsString = [_postIds componentsJoinedByString:@","];
    self.parameters = (@{
                       @"ids" : postIdsString,
                       });

    self.serializationArrayClass = [SNPPost class];

    [super main];
}

@end
