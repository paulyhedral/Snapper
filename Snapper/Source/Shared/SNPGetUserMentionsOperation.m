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

- (instancetype)initWithUserId:(NSUInteger)userId
                     accountId:(NSString*)accountId
                   finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.userId = userId;
        self.serializationArrayClass = [SNPPost class];
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedInstance] getMentionsEndpointURL:_userId];
    
    [super main];
}

@end
