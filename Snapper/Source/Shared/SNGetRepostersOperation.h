//
//  SNGetRepostersOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNBaseOAuthOperation.h"


@interface SNGetRepostersOperation : SNBaseOAuthOperation

// -- Properties --
@property (nonatomic, assign) NSUInteger postId;

// -- Initialization --
- (id)initWithPostId:(NSUInteger)postId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNResponse* response))finishBlock;

@end
