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
@property (nonatomic, copy) NSString* text;
@property (nonatomic, copy) NSString* token;

// -- Initializers --
- (id)initWithText:(NSString*)text
             token:(NSString*)token
       finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
