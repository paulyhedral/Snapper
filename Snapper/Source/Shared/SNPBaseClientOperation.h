//
//  SNPBaseClientOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/23/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPResponse.h"


/**
 * Fundamental API client operation.
 */
@interface SNPBaseClientOperation : NSOperation
<NSURLConnectionDelegate> {

@protected
    NSURLConnection* _connection;
    NSMutableData* _receivedData;
    BOOL _done;
    
}

// -- Properties --
@property (nonatomic, copy) NSURL* endpoint;
@property (nonatomic, copy) NSString* method;
@property (nonatomic, copy) NSDictionary* headers;
@property (nonatomic, copy) NSDictionary* parameters;
@property (nonatomic, copy) NSData* body;
@property (nonatomic, copy) NSString* bodyType;
@property (nonatomic, copy) void (^progressBlock)(NSInteger bytesWritten, NSInteger totalBytesWritten, NSInteger totalBytes);
@property (nonatomic, copy) void (^finishBlock)(SNPResponse* response);
@property (nonatomic, copy) id (^serializationBlock)(id data, NSError** error);
@property (nonatomic, assign) Class serializationRootClass;
@property (nonatomic, assign) Class serializationArrayClass;

// -- Initializers --
- (id)initWithFinishBlock:(void (^)(SNPResponse* response))finishBlock;
- (id)initWithEndpoint:(NSURL*)endpoint
                method:(NSString*)method
               headers:(NSDictionary*)headers
            parameters:(NSDictionary*)parameters
                  body:(NSData*)body
              bodyType:(NSString*)bodyType
         progressBlock:(void (^)(NSInteger bytesWritten, NSInteger totalBytesWritten, NSInteger totalBytes))progressBlock
           finishBlock:(void (^)(SNPResponse* response))finishBlock;

// -- Utility methods --
- (SNPResponse*)createResponseFromJSON:(NSDictionary*)jsonDict;
- (SNPResponse*)createResponseFromError:(NSError*)error;

@end
