//
//  SNPGetMessagesOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseMessageOperation.h"
#import "SNPMessageParameters.h"


@interface SNPGetMessagesOperation : SNPBaseMessageOperation
<SNPMessageParameters>

// -- Properties --
@property (nonatomic, nonnull, retain) NSArray* messageIds;

// -- Initializers --
- (nonnull instancetype)initWithMessageIds:(nonnull NSArray*)messageIds
                                 accountId:(nonnull NSString*)accountId
                               finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
