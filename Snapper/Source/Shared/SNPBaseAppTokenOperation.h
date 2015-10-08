//
//  SNPBaseAppTokenOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/23/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPBaseClientOperation.h"


/**
 * Base class for application token-based operations.
 */
@interface SNPBaseAppTokenOperation : SNPBaseClientOperation

// -- Properties --
@property (nonatomic, nonnull, copy) NSString* appToken;

// -- Initialization --
- (nonnull instancetype)initWithAppToken:(nonnull NSString*)appToken
                             finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
