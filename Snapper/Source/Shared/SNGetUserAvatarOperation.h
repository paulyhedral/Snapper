//
//  SNGetUserAvatarOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNBaseImageFetchOperation.h"


@interface SNGetUserAvatarOperation : SNBaseImageFetchOperation

// -- Properties --
@property (nonatomic, assign) NSUInteger userId;

// -- Initializers --
- (id)initWithUserId:(NSInteger)userId
         finishBlock:(void (^)(id image, NSError* error))finishBlock;

@end
