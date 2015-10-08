//
//  SNPGetFilterOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/22/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"


@interface SNPGetFilterOperation : SNPBaseUserTokenOperation

// -- Properties --
@property (nonatomic, assign) NSUInteger filterId;

// -- Initialization --
- (nonnull instancetype)initWithFilterId:(NSUInteger)filterId
                               accountId:(nonnull NSString*)accountId
                             finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
