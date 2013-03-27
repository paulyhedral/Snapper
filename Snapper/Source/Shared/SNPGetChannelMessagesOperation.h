//
//  SNPGetChannelMessagesOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseMessageOperation.h"


@interface SNPGetChannelMessagesOperation : SNPBaseMessageOperation

// -- Properties --
@property (nonatomic, assign) NSUInteger channelId;

// -- Initializers --
- (id)initWithChannelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
