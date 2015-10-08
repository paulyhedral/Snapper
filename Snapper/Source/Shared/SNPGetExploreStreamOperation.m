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

- (nonnull instancetype)initWithSlug:(nonnull NSString*)slug
                         finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithFinishBlock:finishBlock];
    if(self) {
        self.slug = slug;
        self.serializationArrayClass = [SNPPost class];
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedInstance] getExploreStreamEndpointURL:_slug];

    [super main];
}

@end
