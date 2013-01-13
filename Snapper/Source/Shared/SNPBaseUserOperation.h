//
//  SNPBaseUserOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Snapper/SNPAccount.h>
#import <Snapper/SNPResponse.h>
#import <Snapper/SNPAPIUtils.h>


@interface SNPBaseUserOperation : NSOperation
<NSURLConnectionDelegate>

// -- Properties --
@property (nonatomic, copy) NSURL* endpoint;
@property (nonatomic, copy) NSString* method;
@property (nonatomic, copy) NSDictionary* headers;
@property (nonatomic, copy) NSDictionary* parameters;
@property (nonatomic, copy) NSData* body;
@property (nonatomic, copy) NSString* bodyType;
@property (nonatomic, copy) NSString* accountId;
@property (nonatomic, copy) void (^progressBlock)(NSInteger bytesWritten, NSInteger totalBytesWritten, NSInteger totalBytes);
@property (nonatomic, copy) void (^finishBlock)(SNPResponse* response);
@property (nonatomic, copy) id (^serializationBlock)(id data, NSError** error);
@property (nonatomic, assign) Class serializationRootClass;
@property (nonatomic, assign) Class serializationArrayClass;

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

// -- Utility methods --
- (SNPResponse*)createResponseFromJSON:(NSDictionary*)jsonDict;
- (SNPResponse*)createResponseFromError:(NSError*)error;

@end
