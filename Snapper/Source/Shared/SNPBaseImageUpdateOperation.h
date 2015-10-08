//
//  SNPBaseImageUpdateOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 1/13/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPBaseUserTokenOperation.h"


@interface SNPBaseImageUpdateOperation : SNPBaseUserTokenOperation

// -- Properties --
@property (nonatomic, nonnull, retain) id image;

// -- Initializers --
- (nonnull instancetype)initWithImage:(nonnull id)image
                            accountId:(nonnull NSString*)accountId
                          finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
