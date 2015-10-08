//
//  SNPCurrentTokenOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseClientOperation.h"


@interface SNPCurrentTokenOperation : SNPBaseClientOperation

// -- Properties --
@property (nonatomic, nonnull, copy) NSString* accessToken;
@property (nonatomic, nonnull, copy) NSString* tokenType;

// -- Initializers --

- (nonnull instancetype)initWithAccessToken:(nonnull NSString*)accessToken
                                  tokenType:(nonnull NSString*)tokenType
                                finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
