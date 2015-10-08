//
//  SNPUnmuteChannelOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 3/13/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"
#import "SNPChannelParameters.h"


@interface SNPUnmuteChannelOperation : SNPBaseUserTokenOperation
<SNPChannelParameters>

// -- Properties --
@property (nonatomic, assign) NSUInteger channelId;

// -- Initialization --
- (nonnull instancetype)initWithChannelId:(NSUInteger)channelId
                                accountId:(nonnull NSString*)accountId
                              finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
