//
//  SNPCreateFileOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 1/28/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"
#import "SNPResponse.h"
#import "SNPFileParameters.h"


@interface SNPCreateFileOperation : SNPBaseUserTokenOperation
<SNPFileParameters>

// -- Properties --
@property (nonatomic, nonnull, copy) NSString* filename;
@property (nonatomic, nonnull, copy) NSString* contentType;
@property (nonatomic, nonnull, copy) NSString* type;
@property (nonatomic, nonnull, retain) NSData* data;

// -- Initializers --
- (nonnull instancetype)initWithName:(nonnull NSString*)filename
                         contentType:(nonnull NSString*)contentType
                                type:(nonnull NSString*)type
                                data:(nonnull NSData*)data
                           accountId:(nonnull NSString*)accountId
                         finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
