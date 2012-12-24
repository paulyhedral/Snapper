//
//  SNGetChannelMessagesOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNBaseUserOperation.h"


@interface SNGetChannelMessagesOperation : SNBaseUserOperation

// -- Properties --
@property (nonatomic, assign) NSUInteger channelId;

// -- Initializers --
- (id)initWithChannelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNResponse* response))finishBlock;

@end
