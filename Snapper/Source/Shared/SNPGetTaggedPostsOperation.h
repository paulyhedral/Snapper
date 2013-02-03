//
//  SNPGetTaggedPostsOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserOperation.h"


@interface SNPGetTaggedPostsOperation : SNPBaseUserOperation

// -- Properties --
@property (nonatomic, copy) NSString* hashtag;

// -- Initializers --
- (id)initWithHashtag:(NSString*)hashtag
          finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
