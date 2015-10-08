//
//  SNPGetUserFolloweesOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseStreamOperation.h"
#import "SNPUserParameters.h"
#import "SNPPaginationParameters.h"


@interface SNPGetUserFolloweesOperation : SNPBaseStreamOperation
<SNPUserParameters, SNPPaginationParameters>

// -- Properties --
@property (nonatomic, assign) NSUInteger userId;

// -- Initialization --
- (nonnull instancetype)initWithUserId:(NSUInteger)userId
                             accountId:(nonnull NSString*)accountId
                           finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
