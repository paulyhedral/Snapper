//
//  SNPFollowUserOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPFollowUserOperation.h"

#import "SNPUser.h"

#import "SNPAPIUtils.h"


@implementation SNPFollowUserOperation

#pragma mark - Initialization

- (id)initWithUserId:(NSUInteger)userId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.userId = userId;
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] followUserEndpointURL:userId];
        self.method = @"POST";
        self.serializationRootClass = [SNPUser class];
    }

    return self;
}

@end
