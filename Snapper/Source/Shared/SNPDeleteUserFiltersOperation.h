//
//  SNPDeleteUserFiltersOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/22/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"


@interface SNPDeleteUserFiltersOperation : SNPBaseUserTokenOperation

// -- Initialization --
- (nonnull instancetype)initWithAccountId:(nonnull NSString*)accountId
                              finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
