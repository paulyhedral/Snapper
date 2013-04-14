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
@property (nonatomic, retain) NSArray* objectTypes;
@property (nonatomic, assign) SNPStreamType type;
@property (nonatomic, assign) NSInteger filterId;
@property (nonatomic, copy) NSString* key;

// -- Initializers --
- (id)initWithObjectTypes:(NSArray*)objectTypes
                     type:(SNPStreamType)type
                 filterId:(NSInteger)filterId
                      key:(NSString*)key
                 appToken:(NSString*)appToken
              finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
