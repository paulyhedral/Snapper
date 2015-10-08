//
//  SNPGetSubscribersOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"
#import "SNPChannelParameters.h"
#import "SNPPaginationParameters.h"


@interface SNPGetSubscribersOperation : SNPBaseUserTokenOperation
<SNPChannelParameters, SNPPaginationParameters>

// -- Properties --
@property (nonatomic, nonnull, retain) NSArray* channelIds;

// -- Initialization --
- (nonnull instancetype)initWithChannelIds:(nonnull NSArray*)channelIds
                                 accountId:(nonnull NSString*)accountId
                               finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
