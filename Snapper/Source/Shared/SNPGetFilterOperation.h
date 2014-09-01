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
- (instancetype)initWithFilterId:(NSUInteger)filterId
             accountId:(NSString*)accountId
           finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
