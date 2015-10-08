//
//  SNPUnblockUserOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 6/9/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <Snapper/Snapper.h>
#import "SNPUserParameters.h"


@interface SNPUnblockUserOperation : SNPBaseUserTokenOperation
<SNPUserParameters>

// -- Properties --
@property (nonatomic, assign) NSUInteger userId;

// -- Initialization --
- (instancetype)initWithUserId:(NSUInteger)userId
           accountId:(nonnull NSString*)accountId
         finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
