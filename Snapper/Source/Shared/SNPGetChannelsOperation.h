//
//  SNPGetChannelsOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"
#import "SNPChannelParameters.h"


@interface SNPGetChannelsOperation : SNPBaseUserTokenOperation
<SNPChannelParameters>

// -- Properties --
@property (nonatomic, nullable, retain) NSArray* channelIds;

// -- Initializers --
- (nonnull instancetype)initWithChannelIds:(nullable NSArray*)channelIds
                                 accountId:(nonnull NSString*)accountId
                               finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
