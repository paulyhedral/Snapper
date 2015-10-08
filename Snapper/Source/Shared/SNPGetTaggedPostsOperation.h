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
@property (nonatomic, nonnull, copy) NSString* hashtag;

// -- Initializers --
- (nonnull instancetype)initWithHashtag:(nonnull NSString*)hashtag
                            finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
