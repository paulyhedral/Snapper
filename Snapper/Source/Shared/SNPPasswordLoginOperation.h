//
//  SNPPasswordLoginOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 1/10/14.
//  Copyright (c) 2014 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SNPToken.h"


@interface SNPPasswordLoginOperation : NSOperation
<NSURLConnectionDataDelegate>

@property (nonatomic, copy) NSString* clientId;
@property (nonatomic, copy) NSString* grantSecret;
@property (nonatomic, copy) NSString* username;
@property (nonatomic, copy) NSString* password;
@property (nonatomic, copy) NSString* scope;

- (instancetype)initWithClientId:(NSString*)clientId
                     grantSecret:(NSString*)grantSecret
                        username:(NSString*)username
                        password:(NSString*)password
                           scope:(NSString*)scope
                     finishBlock:(void (^)(NSString*, SNPToken*, NSError*))finishBlock;

@end
