//
//  SNPUnsubscribeFromChannelOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserOperation.h"


@interface SNPUnsubscribeFromChannelOperation : SNPBaseUserOperation

// -- Properties --
@property (nonatomic, assign) NSUInteger channelId;

// -- Initialization --
- (id)initWithChannelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse* response))finishBlock;


@end
