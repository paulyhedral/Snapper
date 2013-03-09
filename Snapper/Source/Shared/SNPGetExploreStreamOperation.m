//
//  SNPGetExploreStreamOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 3/9/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPGetExploreStreamOperation.h"

#import "SNPPost.h"

#import "SNPAPIUtils.h"


@implementation SNPGetExploreStreamOperation

#pragma mark - Initializers

- (id)initWithSlug:(NSString*)slug
       finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithFinishBlock:finishBlock];
    if(self) {
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] getExploreStreamEndpointURL:slug];
        self.serializationArrayClass = [SNPPost class];
    }

    return self;
}

@end
