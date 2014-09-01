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
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* contentType;
@property (nonatomic, copy) NSString* type;
@property (nonatomic, retain) NSData* data;

// -- Initializers --
- (instancetype)initWithName:(NSString*)name
       contentType:(NSString*)contentType
              type:(NSString*)type
              data:(NSData*)data
         accountId:(NSString*)accountId
       finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
