//
//  SNCreateChannelOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNBaseUserOperation.h"

#import "SNACL.h"


@interface SNCreateChannelOperation : SNBaseUserOperation

// -- Properites --
@property (nonatomic, copy) NSString* type;
@property (nonatomic, retain) SNACL* readers;
@property (nonatomic, retain) SNACL* writers;
@property (nonatomic, retain) NSArray* annotations;

// -- Initialization --
- (id)initWithType:(NSString*)type
           readers:(SNACL*)readers
           writers:(SNACL*)writers
       annotations:(NSArray*)annotations
         accountId:(NSString*)accountId
       finishBlock:(void (^)(SNResponse* response))finishBlock;


@end
