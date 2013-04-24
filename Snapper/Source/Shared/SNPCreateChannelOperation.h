//
//  SNPCreateChannelOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"
#import "SNPACL.h"
#import "SNPChannelParameters.h"


@interface SNPCreateChannelOperation : SNPBaseUserTokenOperation
<SNPChannelParameters>

// -- Properites --
@property (nonatomic, copy) NSString* type;
@property (nonatomic, retain) SNPACL* readers;
@property (nonatomic, retain) SNPACL* writers;
@property (nonatomic, retain) NSArray* annotations;

// -- Initialization --
- (id)initWithType:(NSString*)type
           readers:(SNPACL*)readers
           writers:(SNPACL*)writers
       annotations:(NSArray*)annotations
         accountId:(NSString*)accountId
       finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
