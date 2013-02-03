//
//  SNPDeleteStreamOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/23/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseApplicationOperation.h"


@interface SNPDeleteStreamOperation : SNPBaseApplicationOperation

// -- Properties --
@property (nonatomic, assign) NSInteger streamId;

// -- Initializers --
- (id)initWithStreamId:(NSInteger)streamId
              appToken:(NSString*)appToken
           finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
