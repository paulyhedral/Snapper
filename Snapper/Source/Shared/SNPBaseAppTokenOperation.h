//
//  SNPBaseAppTokenOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/23/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

@import Foundation;
#import "SNPBaseClientOperation.h"


/**
 * Base class for application token-based operations.
 */
@interface SNPBaseAppTokenOperation : SNPBaseClientOperation

// -- Properties --
@property (nonatomic, nonnull, copy) NSString* appToken;
@property (nonatomic, nonnull, copy) void (^finishBlock)(nonnull SNPResponse* response);

// -- Initialization --
- (nonnull instancetype)initWithAppToken:(nonnull NSString*)appToken
                             finishBlock:(void (^ _Nonnull)(nonnull SNPResponse* response))finishBlock;

@end
