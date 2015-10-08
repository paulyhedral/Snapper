//
//  SNPProcessTextOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 2/6/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseClientOperation.h"


@interface SNPProcessTextOperation : SNPBaseClientOperation

// -- Properties --
@property (nonatomic, nonnull, copy) NSString* text;
@property (nonatomic, nonnull, copy) NSString* token;

// -- Initializers --
- (nonnull instancetype)initWithText:(nonnull NSString*)text
                               token:(nonnull NSString*)token
                         finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
