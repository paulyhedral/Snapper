//
//  SNPGetChannelSubscribersOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"
#import "SNPChannelParameters.h"
#import "SNPPaginationParameters.h"


@interface SNPGetChannelSubscribersOperation : SNPBaseUserTokenOperation
<SNPChannelParameters, SNPPaginationParameters>

// -- Properties --
@property (nonatomic, assign) NSUInteger channelId;

// -- Initialization --
- (nonnull instancetype)initWithChannelId:(NSUInteger)channelId
                                accountId:(nonnull NSString*)accountId
                              finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
