//
//  SNPMuteChannelOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 3/13/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"
#import "SNPChannelParameters.h"


@interface SNPMuteChannelOperation : SNPBaseUserTokenOperation
<SNPChannelParameters>

// -- Properties --
@property (nonatomic, assign) NSUInteger channelId;

// -- Initialization --
- (instancetype)initWithChannelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
