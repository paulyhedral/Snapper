//
//  SNPGetUsersOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserOperation.h"


@interface SNPGetUsersOperation : SNPBaseUserOperation

// -- Properties --
@property (nonatomic, retain) NSArray* userIds;

// -- Initialization --
- (id)initWithUserIds:(NSArray*)userIds
            accountId:(NSString*)accountId
          finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
