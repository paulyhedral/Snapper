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
@property (nonatomic, copy) NSString* accessToken;
@property (nonatomic, copy) NSString* tokenType;

// -- Initializers --

- (id)initWithAccessToken:(NSString*)accessToken
                tokenType:(NSString*)tokenType
              finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
