//
//  SNPGetPostRepliesOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseStreamOperation.h"
#import "SNPPostParameters.h"
#import "SNPPaginationParameters.h"


@interface SNPGetPostRepliesOperation : SNPBaseStreamOperation
<SNPPostParameters, SNPPaginationParameters>

// -- Properties --
@property (nonatomic, assign) NSUInteger postId;

// -- Initialization --
- (nonnull instancetype)initWithPostId:(NSUInteger)postId
                             accountId:(nonnull NSString*)accountId
                           finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
