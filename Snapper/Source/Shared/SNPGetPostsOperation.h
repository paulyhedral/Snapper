//
//  SNPGetPostsOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"


@interface SNPGetPostsOperation : SNPBaseUserTokenOperation

// -- Properties --
@property (nonatomic, retain) NSArray* postIds;

// -- Initializers --
- (id)initWithPostIds:(NSArray*)postIds
            accountId:(NSString*)accountId
          finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
