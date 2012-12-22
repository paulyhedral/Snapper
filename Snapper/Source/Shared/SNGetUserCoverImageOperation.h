//
//  SNGetUserCoverImageOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNBaseOAuthOperation.h"


@interface SNGetUserCoverImageOperation : SNBaseOAuthOperation

// -- Properties --
@property (nonatomic, assign) NSUInteger userId;

// -- Initializers --
- (id)initWithUserId:(NSInteger)userId
         finishBlock:(void (^)(id image, NSError* error))finishBlock;

@end
