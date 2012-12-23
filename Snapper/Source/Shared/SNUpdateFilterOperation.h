//
//  SNUpdateFilterOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/22/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNBaseOAuthOperation.h"

#import "SNFilter.h"


@interface SNUpdateFilterOperation : SNBaseOAuthOperation

// -- Properties --
@property (nonatomic, assign) NSUInteger filterId;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, assign) SNFilterMatchPolicy matchPolicy;
@property (nonatomic, retain) NSArray* clauses;

// -- Initialization --
- (id)initWithFilterId:(NSUInteger)filterId
                  name:(NSString*)name
           matchPolicy:(SNFilterMatchPolicy)matchPolicy
               clauses:(NSArray*)clauses
             accountId:(NSString*)accountId
           finishBlock:(void (^)(SNResponse* response))finishBlock;

@end
