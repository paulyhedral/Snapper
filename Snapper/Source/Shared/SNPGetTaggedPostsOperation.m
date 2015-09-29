//
//  SNPGetTaggedPostsOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetTaggedPostsOperation.h"

#import "SNPPost.h"

#import "SNPAPIUtils.h"


@implementation SNPGetTaggedPostsOperation

- (instancetype)initWithHashtag:(NSString*)hashtag
          finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithFinishBlock:finishBlock];
    if(self) {
        self.hashtag = hashtag;
        self.serializationArrayClass = [SNPPost class];
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedInstance] getTaggedPostsEndpointURL:_hashtag];

    [super main];
}

@end
