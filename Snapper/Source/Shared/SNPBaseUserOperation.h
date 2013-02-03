//
//  SNPBaseUserOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPBaseClientOperation.h"


@interface SNPBaseUserOperation : SNPBaseClientOperation

// -- Properties --
@property (nonatomic, copy) NSString* accountId;

// -- Initializers --
- (id)initWithAccountId:(NSString*)accountId
           finishBlock:(void (^)(SNPResponse* response))finishBlock;
- (id)initWithEndpoint:(NSURL*)endpoint
                method:(NSString*)method
               headers:(NSDictionary*)headers
            parameters:(NSDictionary*)parameters
                  body:(NSData*)body
              bodyType:(NSString*)bodyType
             accountId:(NSString*)accountId
         progressBlock:(void (^)(NSInteger bytesWritten, NSInteger totalBytesWritten, NSInteger totalBytes))progressBlock
           finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
