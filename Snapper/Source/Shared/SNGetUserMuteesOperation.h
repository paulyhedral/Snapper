//
//  SNGetUserMuteesOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNBaseUserOperation.h"


@interface SNGetUserMuteesOperation : SNBaseUserOperation

// -- Properties --

// -- Initialization --
- (id)initWithAccountId:(NSString*)accountId
         finishBlock:(void (^)(SNResponse* response))finishBlock;

@end
