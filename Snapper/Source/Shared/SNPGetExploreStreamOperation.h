//
//  SNPGetExploreStreamOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 3/9/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseClientOperation.h"


@interface SNPGetExploreStreamOperation : SNPBaseClientOperation

// -- Properties --
@property (nonatomic, copy) NSString* slug;

// -- Initializers --
- (id)initWithSlug:(NSString*)slug
       finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
