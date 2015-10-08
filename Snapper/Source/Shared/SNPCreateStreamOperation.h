//
//  SNPCreateStreamOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/23/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseAppTokenOperation.h"

#import "SNPStream.h"


@interface SNPCreateStreamOperation : SNPBaseAppTokenOperation

// -- Properties --
@property (nonatomic, nonnull, retain) NSArray* objectTypes;
@property (nonatomic, assign) SNPStreamType type;
@property (nonatomic, assign) NSInteger filterId;
@property (nonatomic, nonnull, copy) NSString* key;

// -- Initializers --
- (nonnull instancetype)initWithObjectTypes:(nonnull NSArray*)objectTypes
                                       type:(SNPStreamType)type
                                   filterId:(NSUInteger)filterId
                                        key:(nonnull NSString*)key
                                   appToken:(nonnull NSString*)appToken
                                finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
