//
//  SNPDeletePostOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"
#import "SNPPostParameters.h"


@interface SNPDeletePostOperation : SNPBaseUserTokenOperation
<SNPPostParameters>

// -- Properties --
@property (nonatomic, assign) NSUInteger postId;

// -- Initialization --
- (id)initWithPostId:(NSUInteger)postId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
