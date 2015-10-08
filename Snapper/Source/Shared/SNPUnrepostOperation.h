//
//  SNPUnrepostOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"
#import "SNPPostParameters.h"


@interface SNPUnrepostOperation : SNPBaseUserTokenOperation
<SNPPostParameters>

// -- Properties --
@property (nonatomic, assign) NSUInteger postId;

// -- Initialization --
- (nonnull instancetype)initWithPostId:(NSUInteger)postId
                             accountId:(nonnull NSString*)accountId
                           finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
