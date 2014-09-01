//
//  SNPGetChannelMessagesOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseMessageOperation.h"
#import "SNPMessageParameters.h"
#import "SNPPaginationParameters.h"


@interface SNPGetChannelMessagesOperation : SNPBaseMessageOperation
<SNPPaginationParameters>

// -- Properties --
@property (nonatomic, assign) NSUInteger channelId;

// -- Initializers --
- (instancetype)initWithChannelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
