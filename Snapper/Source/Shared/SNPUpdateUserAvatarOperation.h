//
//  SNPUpdateUserAvatarOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserOperation.h"


@interface SNPUpdateUserAvatarOperation : SNPBaseUserOperation

// -- Properties --
@property (nonatomic, retain) id image;

// -- Initializers --
- (id)initWithImage:(id)image
          accountId:(NSString*)accountId
        finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end