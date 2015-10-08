//
//  SNPBaseFileOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 1/28/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Snapper/SNPAccount.h>
#import <Snapper/SNPResponse.h>
#import <Snapper/SNPAPIUtils.h>


@interface SNPBaseFileOperation : NSOperation
<NSURLConnectionDelegate>

// -- Properties --
@property (nonatomic, nonnull, copy) NSURL* endpoint;
@property (nonatomic, nonnull, copy) NSString* method;
@property (nonatomic, nullable, copy) NSDictionary* headers;
@property (nonatomic, nullable, copy) NSDictionary* parameters;
@property (nonatomic, nullable, copy) NSData* body;
@property (nonatomic, nullable, copy) NSString* bodyType;
@property (nonatomic, nonnull, copy) NSString* accountId;
@property (nonatomic, nonnull, copy) NSString* fileToken;
@property (nonatomic, nullable, copy) void (^progressBlock)(NSInteger bytesWritten, NSInteger totalBytesWritten, NSInteger totalBytes);
@property (nonatomic, nonnull, copy) void (^finishBlock)(SNPResponse* _Nonnull response);
@property (nonatomic, nullable, copy) id _Nullable (^serializationBlock)(id _Nullable data, NSError* _Nullable * _Nullable error);
@property (nonatomic, nullable, assign) Class serializationRootClass;
@property (nonatomic, nullable, assign) Class serializationArrayClass;
@property (nonatomic, assign) NSTimeInterval timeout;

// -- Initializers --
- (nonnull instancetype)initWithAccountId:(nonnull NSString*)accountId
                              finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;
- (nonnull instancetype)initWithEndpoint:(nonnull NSURL*)endpoint
                                  method:(nonnull NSString*)method
                                 headers:(nullable NSDictionary*)headers
                              parameters:(nullable NSDictionary*)parameters
                                    body:(nullable NSData*)body
                                bodyType:(nullable NSString*)bodyType
                               fileToken:(nonnull NSString*)fileToken
                               accountId:(nonnull NSString*)accountId
                           progressBlock:(nullable void (^)(NSInteger bytesWritten, NSInteger totalBytesWritten, NSInteger totalBytes))progressBlock
                             finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

// -- Utility methods --
- (nullable SNPResponse*)createResponseFromJSON:(nonnull NSDictionary*)jsonDict;
- (nullable SNPResponse*)createResponseFromError:(nonnull NSError*)error;

@end
