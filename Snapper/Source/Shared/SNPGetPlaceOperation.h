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
@property (nonatomic, copy) NSString* factualId;
@property (nonatomic, copy) NSString* token;

// -- Initializers --
- (instancetype)initWithFactualId:(NSString*)factualId
                  token:(NSString*)token
            finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
