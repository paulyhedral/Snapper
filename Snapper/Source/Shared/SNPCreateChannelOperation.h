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
@property (nonatomic, nonnull, copy) NSString* type;
@property (nonatomic, nonnull, retain) SNPACL* readers;
@property (nonatomic, nullable, retain) SNPACL* writers;
@property (nonatomic, nullable, retain) NSArray* annotations;

// -- Initialization --
- (nonnull instancetype)initWithType:(nonnull NSString*)type
                             readers:(nonnull SNPACL*)readers
                             writers:(nullable SNPACL*)writers
                         annotations:(nullable NSArray*)annotations
                           accountId:(nonnull NSString*)accountId
                         finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
