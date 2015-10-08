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
@property (nonatomic, nonnull, copy) NSString* fullname;
@property (nonatomic, assign) SNPFilterMatchPolicy matchPolicy;
@property (nonatomic, nullable, retain) NSArray* clauses;

// -- Initialization --
- (nonnull instancetype)initWithFilterId:(NSUInteger)filterId
                                    name:(nonnull NSString*)name
                             matchPolicy:(SNPFilterMatchPolicy)matchPolicy
                                 clauses:(nullable NSArray*)clauses
                               accountId:(nonnull NSString*)accountId
                             finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
