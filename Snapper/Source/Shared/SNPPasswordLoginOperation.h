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

@property (nonatomic, nonnull, copy) NSString* clientId;
@property (nonatomic, nonnull, copy) NSString* grantSecret;
@property (nonatomic, nonnull, copy) NSString* username;
@property (nonatomic, nonnull, copy) NSString* password;
@property (nonatomic, nonnull, copy) NSString* scope;

- (nullable instancetype)initWithClientId:(nonnull NSString*)clientId
                              grantSecret:(nonnull NSString*)grantSecret
                                 username:(nonnull NSString*)username
                                 password:(nonnull NSString*)password
                                    scope:(nonnull NSString*)scope
                              finishBlock:(nonnull void (^)(NSString* _Nullable, SNPToken* _Nullable, NSError* _Nullable))finishBlock;

@end
