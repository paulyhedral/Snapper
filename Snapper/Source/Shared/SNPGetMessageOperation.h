//
//  SNPGetMessageOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseMessageOperation.h"
#import "SNPMessageParameters.h"


@interface SNPGetMessageOperation : SNPBaseMessageOperation
<SNPMessageParameters>

// -- Properties --
@property (nonatomic, assign) NSUInteger messageId;
@property (nonatomic, assign) NSUInteger channelId;

// -- Initializers --
- (nonnull instancetype)initWithMessageId:(NSUInteger)messageId
                                channelId:(NSUInteger)channelId
                                accountId:(nonnull NSString*)accountId
                              finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
