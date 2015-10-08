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

/**
 *	<#Description#>
 */
@property (nonatomic, nonnull, copy) NSURL* endpoint;
@property (nonatomic, nonnull, copy) NSString* method;
@property (nonatomic, nullable, copy) NSDictionary* headers;
@property (nonatomic, nullable, copy) NSDictionary* parameters;
@property (nonatomic, nullable, copy) NSData* body;
@property (nonatomic, nullable, copy) NSString* bodyType;
@property (nonatomic, nullable, copy) void (^progressBlock)(NSUInteger bytesWritten, NSUInteger totalBytesWritten, NSUInteger totalBytes);
@property (nonatomic, nonnull, copy) void (^finishBlock)(SNPResponse* _Nonnull response);
@property (nonatomic, nullable, copy) id (^serializationBlock)(id _Nullable data, NSError* _Nullable * error);
@property (nonatomic, nullable, assign) Class serializationRootClass;
@property (nonatomic, nullable, assign) Class serializationArrayClass;
@property (nonatomic, assign) NSTimeInterval timeout;

// -- Initializers --

/**
 *	<#Description#>
 *
 *	@return	<#return value description#>
 */
- (nonnull instancetype)initWithFinishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;
/**
 *	<#Description#>
 *
 *	@param	endpoint	<#endpoint description#>
 *	@param	method	<#method description#>
 *	@param	headers	<#headers description#>
 *	@param	parameters	<#parameters description#>
 *	@param	body	<#body description#>
 *	@param	bodyType	<#bodyType description#>
 *
 *	@return	<#return value description#>
 */
- (nonnull instancetype)initWithEndpoint:(nonnull NSURL*)endpoint
                                  method:(nonnull NSString*)method
                                 headers:(nullable NSDictionary*)headers
                              parameters:(nullable NSDictionary*)parameters
                                    body:(nullable NSData*)body
                                bodyType:(nonnull NSString*)bodyType
                           progressBlock:(nullable void (^)(NSUInteger bytesWritten, NSUInteger totalBytesWritten, NSUInteger totalBytes))progressBlock
                             finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

// -- Utility methods --

/**
 *	<#Description#>
 *
 *	@param	jsonDict	<#jsonDict description#>
 *
 *	@return	<#return value description#>
 */
- (nullable SNPResponse*)createResponseFromJSON:(nonnull NSDictionary*)jsonDict;
/**
 *	<#Description#>
 *
 *	@param	error	<#error description#>
 *
 *	@return	<#return value description#>
 */
- (nullable SNPResponse*)createResponseFromError:(nonnull NSError*)error;

@end
