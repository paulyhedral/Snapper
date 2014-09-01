//
//  SNPUnstarPostOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPUnstarPostOperation.h"

#import "SNPPost.h"

#import "SNPAPIUtils.h"


@implementation SNPUnstarPostOperation

#pragma mark - Initialization

- (instancetype)initWithPostId:(NSUInteger)postId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.postId = postId;
        self.method = @"DELETE";
        self.serializationRootClass = [SNPPost class];
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] unstarPostEndpointURL:_postId];

    [super main];
}

@end
