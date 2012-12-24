//
//  SNGetUsersOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNBaseUserOperation.h"


@interface SNGetUsersOperation : SNBaseUserOperation

// -- Properties --
@property (nonatomic, retain) NSArray* userIds;

// -- Initialization --
- (id)initWithUserIds:(NSArray*)userIds
            accountId:(NSString*)accountId
          finishBlock:(void (^)(SNResponse* response))finishBlock;

@end
