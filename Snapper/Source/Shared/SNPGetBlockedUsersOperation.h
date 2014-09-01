//
//  SNPGetBlockedUsersOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 6/8/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"
#import "SNPUserParameters.h"


@interface SNPGetBlockedUsersOperation : SNPBaseUserTokenOperation
<SNPUserParameters>

// -- Properties --
@property (nonatomic, assign) NSInteger userId;

// -- Initialization --
- (instancetype)initWithUserId:(NSUInteger)UserId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
