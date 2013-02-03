//
//  SNPStarPostOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPStarPostOperation.h"

#import "SNPAPIUtils.h"


@implementation SNPStarPostOperation

#pragma mark - Initialization

- (id)initWithPostId:(NSUInteger)postId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.postId = postId;
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] starPostEndpointURL:postId];
        self.method = @"POST";
    }

    return self;
}

@end
