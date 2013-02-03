//
//  SNPGetChannelsOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserOperation.h"


@interface SNPGetChannelsOperation : SNPBaseUserOperation

// -- Properties --
@property (nonatomic, retain) NSArray* channelIds;

// -- Initializers --
- (id)initWithChannelIds:(NSArray*)channelIds
               accountId:(NSString*)accountId
             finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
