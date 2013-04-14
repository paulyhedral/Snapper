//
//  SNPUpdateFilterOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/22/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"

#import "SNPFilter.h"


@interface SNPUpdateFilterOperation : SNPBaseUserTokenOperation

// -- Properties --
@property (nonatomic, assign) NSUInteger filterId;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, assign) SNPFilterMatchPolicy matchPolicy;
@property (nonatomic, retain) NSArray* clauses;

// -- Initialization --
- (id)initWithFilterId:(NSUInteger)filterId
                  name:(NSString*)name
           matchPolicy:(SNPFilterMatchPolicy)matchPolicy
               clauses:(NSArray*)clauses
             accountId:(NSString*)accountId
           finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
