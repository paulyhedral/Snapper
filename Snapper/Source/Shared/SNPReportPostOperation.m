//
//  SNPReportPostOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 2/14/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPReportPostOperation.h"

#import "SNPPost.h"

#import "SNPAPIUtils.h"


@implementation SNPReportPostOperation

#pragma mark - Initializer

- (id)initWithPostId:(NSUInteger)postId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.postId = postId;
        self.method = @"POST";
        self.serializationRootClass = [SNPPost class];
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] reportPostEndpointURL:_postId];

    [super main];
}

@end
