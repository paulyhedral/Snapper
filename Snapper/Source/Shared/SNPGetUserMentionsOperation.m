//
//  SNPGetUserMentionsOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetUserMentionsOperation.h"

#import "SNPPost.h"

#import "SNPAPIUtils.h"


@implementation SNPGetUserMentionsOperation

#pragma mark - Initialization

- (id)initWithUserId:(NSUInteger)userId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.userId = userId;
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] getUserPostsEndpointURL:userId];
        self.serializationArrayClass = [SNPPost class];
    }

    return self;
}

@end
