//
//  SNPBaseUserTokenOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPBaseClientOperation.h"


@interface SNPBaseUserTokenOperation : SNPBaseClientOperation

// -- Properties --
@property (nonatomic, copy) NSString* accountId;

@property (nonatomic, assign) BOOL includeMachine;
@property (nonatomic, assign) BOOL includeMuted;
@property (nonatomic, assign) BOOL includeDeleted;
@property (nonatomic, assign) BOOL includeAnnotations;
@property (nonatomic, assign) BOOL includeUserAnnotations;
@property (nonatomic, assign) BOOL includeUser;
@property (nonatomic, assign) BOOL includeDirected;

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
