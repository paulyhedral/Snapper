//
//  SNPUpdateUserAvatarOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPUpdateUserAvatarOperation.h"

#if TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR
#import <UIKit/UIKit.h>
#else
#import <Cocoa/Cocoa.h>
#endif

#import "SNPAPIUtils.h"


@implementation SNPUpdateUserAvatarOperation

#pragma mark - Initializers

- (id)initWithImage:(id)image
          accountId:(NSString*)accountId
        finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super init];
    if(self) {
        self.image = image;
        self.accountId = accountId;
        self.finishBlock = finishBlock;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    // TODO
    
}

@end
