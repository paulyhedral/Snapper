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

/**
 *	<#Description#>
 *
 *	@return	<#return value description#>
 */
- (id)initWithFinishBlock:(void (^)(SNPResponse* response))finishBlock;
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
- (id)initWithEndpoint:(NSURL*)endpoint
                method:(NSString*)method
               headers:(NSDictionary*)headers
            parameters:(NSDictionary*)parameters
                  body:(NSData*)body
              bodyType:(NSString*)bodyType
         progressBlock:(void (^)(NSInteger bytesWritten, NSInteger totalBytesWritten, NSInteger totalBytes))progressBlock
           finishBlock:(void (^)(SNPResponse* response))finishBlock;

// -- Utility methods --

/**
 *	<#Description#>
 *
 *	@param	jsonDict	<#jsonDict description#>
 *
 *	@return	<#return value description#>
 */
- (SNPResponse*)createResponseFromJSON:(NSDictionary*)jsonDict;
/**
 *	<#Description#>
 *
 *	@param	error	<#error description#>
 *
 *	@return	<#return value description#>
 */
- (SNPResponse*)createResponseFromError:(NSError*)error;

@end
