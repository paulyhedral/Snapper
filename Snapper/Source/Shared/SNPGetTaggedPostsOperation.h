//
//  SNPGetTaggedPostsOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseStreamOperation.h"
#import "SNPPostParameters.h"


@interface SNPGetTaggedPostsOperation : SNPBaseStreamOperation
<SNPPostParameters>

// -- Properties --
@property (nonatomic, copy) NSString* hashtag;

// -- Initializers --
- (instancetype)initWithHashtag:(NSString*)hashtag
          finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
