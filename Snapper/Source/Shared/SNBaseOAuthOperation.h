//
//  SNBaseOAuthOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SNAccount.h"
#import "SNResponse.h"


@interface SNBaseOAuthOperation : NSOperation
<NSURLConnectionDelegate>

// -- Properties --
@property (nonatomic, copy) NSURL* endpoint;
@property (nonatomic, copy) NSString* method;
@property (nonatomic, copy) NSDictionary* headers;
@property (nonatomic, copy) NSDictionary* parameters;
@property (nonatomic, copy) NSData* body;
@property (nonatomic, copy) NSString* bodyType;
@property (nonatomic, copy) NSString* accountId;

// -- Initializers --
- (id)initWithEndpoint:(NSURL*)endpoint
                method:(NSString*)method
               headers:(NSDictionary*)headers
            parameters:(NSDictionary*)parameters
                  body:(NSData*)body
              bodyType:(NSString*)bodyType
               accountId:(NSString*)accountId
           finishBlock:(void (^)(SNResponse* response))finishBlock;

@end
