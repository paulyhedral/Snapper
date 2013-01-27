//
//  SNPGetUserMuteesOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserOperation.h"


@interface SNPGetUserMuteesOperation : SNPBaseUserOperation

// -- Properties --

// -- Initialization --
- (id)initWithAccountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end