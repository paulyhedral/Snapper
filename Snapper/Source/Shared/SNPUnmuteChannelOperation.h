//
//  SNPUnmuteChannelOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 3/13/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserOperation.h"


@interface SNPUnmuteChannelOperation : SNPBaseUserOperation

// -- Properties --
@property (nonatomic, assign) NSUInteger channelId;

// -- Initialization --
- (id)initWithChannelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
