//
//  SNPUpdateChannelOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"
#import "SNPACL.h"
#import "SNPChannelParameters.h"


@interface SNPUpdateChannelOperation : SNPBaseUserTokenOperation
<SNPChannelParameters>

// -- Properties --
@property (nonatomic, assign) NSUInteger channelId;
@property (nonatomic, nullable, retain) NSArray* annotations;
@property (nonatomic, nullable, retain) SNPACL* readers;
@property (nonatomic, nullable, retain) SNPACL* writers;

// -- Initialization --
- (nonnull instancetype)initWithChannelId:(NSUInteger)channelId
                                accountId:(nonnull NSString*)accountId
                              finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
