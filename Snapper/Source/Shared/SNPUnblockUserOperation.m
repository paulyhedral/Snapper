//
//  SNPUnblockUserOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 6/9/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPUnblockUserOperation.h"

#import "SNPUser.h"

#import "SNPAPIUtils.h"


@implementation SNPUnblockUserOperation

#pragma mark - Initialization

- (instancetype)initWithUserId:(NSUInteger)userId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.userId = userId;
        self.method = @"DELETE";
        self.serializationRootClass = [SNPUser class];
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedInstance] unblockUserEndpointURL:_userId];

    [super main];
}

@end
