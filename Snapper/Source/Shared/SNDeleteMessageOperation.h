//
//  SNDeleteMessageOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNBaseOAuthOperation.h"


@interface SNDeleteMessageOperation : SNBaseOAuthOperation

// -- Properties --
@property (nonatomic, assign) NSUInteger messageId;
@property (nonatomic, assign) NSUInteger channelId;

// -- Initializers --
- (id)initWithMessageId:(NSUInteger)messageId
              channelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNResponse* response))finishBlock;

@end
