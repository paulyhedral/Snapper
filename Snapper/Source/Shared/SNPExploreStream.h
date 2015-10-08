//
//  SNPExploreStream.h
//  Snapper
//
//  Created by Paul Schifferer on 3/9/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>


@interface SNPExploreStream : MTLModel
<MTLJSONSerializing>

@property (nonatomic, nonnull, copy) NSString* slug;
@property (nonatomic, nonnull, copy) NSString* title;
@property (nonatomic, nonnull, copy) NSString* exploreDescription;
@property (nonatomic, nonnull, copy) NSURL* URL;

@end
