//
//  SNPUpdateChannelOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"

#import "SNPACL.h"


@interface SNPUpdateChannelOperation : SNPBaseUserTokenOperation

// -- Properties --
@property (nonatomic, assign) NSUInteger channelId;
@property (nonatomic, retain) NSArray* annotations;
@property (nonatomic, retain) SNPACL* readers;
@property (nonatomic, retain) SNPACL* writers;

// -- Initialization --
- (id)initWithChannelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
