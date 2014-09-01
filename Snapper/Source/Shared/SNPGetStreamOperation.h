//
//  SNPGetStreamOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/23/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseAppTokenOperation.h"


@interface SNPGetStreamOperation : SNPBaseAppTokenOperation

// -- Properties --
@property (nonatomic, assign) NSInteger streamId;

// -- Initializers --
- (instancetype)initWithStreamId:(NSUInteger)streamId
              appToken:(NSString*)appToken
           finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
