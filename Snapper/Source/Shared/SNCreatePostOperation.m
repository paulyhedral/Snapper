//
//  SNCreatePostOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNCreatePostOperation.h"

#import "SNAccountManager.h"

#import "SNAPIUtils.h"


@implementation SNCreatePostOperation

- (id)initWithText:(NSString*)text
           replyTo:(NSInteger)replyTo
       machineOnly:(BOOL)machineOnly
       annotations:(NSArray*)annotations
          entities:(NSArray*)entities
         accountId:(NSString*)accountId
       finishBlock:(void (^)(SNResponse* response))finishBlock {

    self = [super initWithEndpoint:<#(NSURL *)#>
                            method:@"POST"
                           headers:nil
                        parameters:nil
                              body:postBody
                          bodyType:@"application/json"
                         accountId:accountId
                       finishBlock:<#^(SNResponse *response)finishBlock#>];
    if(self) {

    }

    return self;
}

@end
