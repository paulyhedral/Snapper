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
                         finishBlock:(void (nonnull ^)(nonnull SNPResponse* response))finishBlock;

@end
