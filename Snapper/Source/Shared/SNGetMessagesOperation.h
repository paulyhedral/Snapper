//
//  SNGetMessagesOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNBaseUserOperation.h"


@interface SNGetMessagesOperation : SNBaseUserOperation

// -- Properties --
@property (nonatomic, retain) NSArray* messageIds;

// -- Initializers --
- (id)initWithMessageIds:(NSArray*)messageIds
               accountId:(NSString*)accountId
             finishBlock:(void (^)(SNResponse* response))finishBlock;

@end
