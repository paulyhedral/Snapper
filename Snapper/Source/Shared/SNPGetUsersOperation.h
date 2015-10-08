//
//  SNPGetUsersOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"
#import "SNPUserParameters.h"


@interface SNPGetUsersOperation : SNPBaseUserTokenOperation
<SNPUserParameters>

// -- Properties --
@property (nonatomic, retain) NSArray* userIds;

// -- Initialization --
- (instancetype)initWithUserIds:(NSArray*)userIds
            accountId:(nonnull NSString*)accountId
          finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
