//
//  SNPGetPostsOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"
#import "SNPPostParameters.h"


@interface SNPGetPostsOperation : SNPBaseUserTokenOperation
<SNPPostParameters>

// -- Properties --
@property (nonatomic, nonnull, retain) NSArray* postIds;

// -- Initializers --
- (nonnull instancetype)initWithPostIds:(nonnull NSArray*)postIds
                              accountId:(nonnull NSString*)accountId
                            finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
