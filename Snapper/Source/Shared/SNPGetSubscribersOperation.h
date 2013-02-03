//
//  SNPGetSubscribersOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserOperation.h"


@interface SNPGetSubscribersOperation : SNPBaseUserOperation

// -- Properties --
@property (nonatomic, retain) NSArray* channelIds;

// -- Initialization --
- (id)initWithChannelIds:(NSArray*)channelIds
               accountId:(NSString*)accountId
             finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
