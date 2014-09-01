//
//  SNPMetadata.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SNPStreamMarker.h"
#import "SNPExploreStream.h"


@interface SNPMetadata : NSObject

@property (nonatomic, assign) NSInteger code;

// -- Error information --
@property (nonatomic, copy) NSString* errorId;
@property (nonatomic, copy) NSString* errorSlug;
@property (nonatomic, copy) NSString* errorMessage;
@property (nonatomic, copy) NSError* error;

// -- Pagination data --
@property (nonatomic, assign) NSUInteger minId;
@property (nonatomic, assign) NSUInteger maxId;
@property (nonatomic, assign) BOOL more;

// -- Stream marker data --
@property (nonatomic, retain) SNPStreamMarker* streamMarker;

// -- Explore stream data --
@property (nonatomic, retain) SNPExploreStream* exploreStream;

// -- Subscription --
@property (nonatomic, copy) NSString* subscriptionId;

// -- Headers --
@property (nonatomic, retain) NSDictionary* headers;

@end
