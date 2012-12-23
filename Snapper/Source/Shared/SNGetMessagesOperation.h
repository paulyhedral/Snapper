//
//  SNGetMessagesOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNBaseOAuthOperation.h"


@interface SNGetMessagesOperation : SNBaseOAuthOperation

// -- Properties --
@property (nonatomic, retain) NSArray* messageIds;

// -- Initializers --
- (id)initWithMessageIds:(NSArray*)messageIds
               accountId:(NSString*)accountId
             finishBlock:(void (^)(SNResponse* response))finishBlock;

@end
