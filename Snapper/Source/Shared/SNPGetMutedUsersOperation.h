//
//  SNPGetMutedUsersOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 6/8/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"
#import "SNPUserParameters.h"


@interface SNPGetMutedUsersOperation : SNPBaseUserTokenOperation
<SNPUserParameters>

// -- Properties --
@property (nonatomic, assign) NSInteger userId;

// -- Initialization --
- (instancetype)initWithUserId:(NSUInteger)userId
           accountId:(nonnull NSString*)accountId
         finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
