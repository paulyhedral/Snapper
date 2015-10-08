//
//  SNPBlockUserOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 5/12/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBlockUserOperation.h"

#import "SNPUser.h"

#import "SNPAPIUtils.h"


@implementation SNPBlockUserOperation

#pragma mark - Initialization

- (instancetype)initWithUserId:(NSUInteger)userId
                     accountId:(NSString*)accountId
                   finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.userId = userId;
        self.method = @"POST";
        self.serializationRootClass = [SNPUser class];
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedInstance] blockUserEndpointURL:_userId];
    
    [super main];
}

@end
