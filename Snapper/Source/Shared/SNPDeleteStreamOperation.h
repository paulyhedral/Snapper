//
//  SNPDeleteStreamOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/23/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseAppTokenOperation.h"


@interface SNPDeleteStreamOperation : SNPBaseAppTokenOperation

// -- Properties --
@property (nonatomic, assign) NSInteger streamId;

// -- Initializers --
- (nonnull instancetype)initWithStreamId:(NSUInteger)streamId
                                appToken:(nonnull NSString*)appToken
                             finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
