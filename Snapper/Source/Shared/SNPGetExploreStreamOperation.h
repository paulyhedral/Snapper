//
//  SNPGetExploreStreamOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 3/9/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseStreamOperation.h"


@interface SNPGetExploreStreamOperation : SNPBaseStreamOperation

// -- Properties --
@property (nonatomic, nonnull, copy) NSString* slug;

// -- Initializers --
- (nonnull instancetype)initWithSlug:(nonnull NSString*)slug
                         finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
