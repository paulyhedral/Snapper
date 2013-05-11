//
//  SNPMuteUserOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPMuteUserOperation.h"

#import "SNPUser.h"

#import "SNPAPIUtils.h"


@implementation SNPMuteUserOperation

#pragma mark - Initialization

- (id)initWithUserId:(NSUInteger)userId
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

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] muteUserEndpointURL:_userId];

    [super main];
}

@end
