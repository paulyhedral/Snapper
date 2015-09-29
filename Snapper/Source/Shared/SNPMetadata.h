//
//  SNPMetadata.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

@import Foundation;

#import "SNPStreamMarker.h"
#import "SNPExploreStream.h"


@interface SNPMetadata : NSObject

@property (nonatomic, assign) NSInteger code;

// -- Error information --
@property (nonatomic, nullable, copy) NSString* errorId;
@property (nonatomic, nullable, copy) NSString* errorSlug;
@property (nonatomic, nullable, copy) NSString* errorMessage;
@property (nonatomic, nullable, copy) NSError* error;

// -- Pagination data --
@property (nonatomic, assign) NSUInteger minId;
@property (nonatomic, assign) NSUInteger maxId;
@property (nonatomic, assign) BOOL more;

// -- Stream marker data --
@property (nonatomic, nullable, retain) SNPStreamMarker* streamMarker;

// -- Explore stream data --
@property (nonatomic, nullable, retain) SNPExploreStream* exploreStream;

// -- Subscription --
@property (nonatomic, nullable, copy) NSString* subscriptionId;

// -- Headers --
@property (nonatomic, nonnull, retain) NSDictionary* headers;

@end
