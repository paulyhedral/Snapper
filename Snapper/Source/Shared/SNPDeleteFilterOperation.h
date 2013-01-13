//
//  SNPDeleteFilterOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/22/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserOperation.h"


@interface SNPDeleteFilterOperation : SNPBaseUserOperation

// -- Properties --
@property (nonatomic, assign) NSUInteger filterId;

// -- Initialization --
- (id)initWithFilterId:(NSUInteger)filterId
             accountId:(NSString*)accountId
           finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
