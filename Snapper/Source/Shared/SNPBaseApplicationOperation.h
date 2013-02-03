//
//  SNPBaseApplicationOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/23/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPBaseClientOperation.h"


@interface SNPBaseApplicationOperation : SNPBaseClientOperation

// -- Properties --
@property (nonatomic, copy) NSString* appToken;
@property (nonatomic, copy) void (^finishBlock)(SNPResponse* response);

// -- Initialization --
- (id)initWithAppToken:(NSString*)appToken
           finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
