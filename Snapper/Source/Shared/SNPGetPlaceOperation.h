//
//  SNPGetPlaceOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 2/5/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseClientOperation.h"


@interface SNPGetPlaceOperation : SNPBaseClientOperation

// -- Properties --
@property (nonatomic, nonnull, copy) NSString* factualId;
@property (nonatomic, nonnull, copy) NSString* token;

// -- Initializers --
- (nonnull instancetype)initWithFactualId:(nonnull NSString*)factualId
                                    token:(nonnull NSString*)token
                              finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
