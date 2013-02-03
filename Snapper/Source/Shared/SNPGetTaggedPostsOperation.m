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

- (id)initWithHashtag:(NSString*)hashtag
          finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithFinishBlock:finishBlock];
    if(self) {
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] getTaggedPostsEndpointURL:hashtag];
        self.serializationArrayClass = [SNPPost class];
    }

    return self;
}

@end
