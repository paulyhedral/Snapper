//
//  SNPDeleteMessageOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserOperation.h"


@interface SNPDeleteMessageOperation : SNPBaseUserOperation

// -- Properties --
@property (nonatomic, assign) NSUInteger messageId;
@property (nonatomic, assign) NSUInteger channelId;

// -- Initializers --
- (id)initWithMessageId:(NSUInteger)messageId
              channelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
