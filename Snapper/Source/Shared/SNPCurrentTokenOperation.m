//
//  SNPCurrentTokenOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPCurrentTokenOperation.h"

#import "NSString+URLEncoding.h"

#import "SNPToken.h"

#import "SNPAPIUtils.h"


@implementation SNPCurrentTokenOperation

#pragma mark - Initializers

- (instancetype)initWithAccessToken:(NSString*)accessToken
                tokenType:(NSString*)tokenType
              finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithFinishBlock:finishBlock];
    if(self) {
        self.accessToken = accessToken;
        self.tokenType = tokenType;
    }

    return self;
}

#pragma mark - Workhorse

- (void)main {

    NSAssert(self.accessToken, @"No access token set for API operation!");
    NSAssert(self.tokenType, @"No token type set for API operation!");

    self.endpoint = [[SNPAPIUtils sharedInstance] tokenEndpointURL];
    self.serializationRootClass = [SNPToken class];

    // OAuth header
    NSString* tokenValue = [NSString stringWithFormat:@"%@ %@", self.tokenType, self.accessToken];
    self.headers = (@{
                    @"Authorization" : tokenValue,
                    });

    [super main];
}

@end
