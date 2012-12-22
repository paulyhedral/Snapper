//
//  SNCreateChannelOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNBaseOAuthOperation.h"


@interface SNCreateChannelOperation : SNBaseOAuthOperation

// -- Properites --
@property (nonatomic, copy) NSString* type;
@property (nonatomic, retain) NSArray* readers;
@property (nonatomic, retain) NSArray* writers;
@property (nonatomic, retain) NSArray* annotations;

// -- Initialization --
- (id)initWithType:(NSString*)type
           readers:(NSArray*)readers
           writers:(NSArray*)writers
       annotations:(NSArray*)annotations
         accountId:(NSString*)accountId
       finishBlock:(void (^)(SNResponse* response))finishBlock;


@end
