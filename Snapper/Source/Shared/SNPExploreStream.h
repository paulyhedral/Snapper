//
//  SNPExploreStream.h
//  Snapper
//
//  Created by Paul Schifferer on 3/9/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>


@interface SNPExploreStream : MTLModel

@property (nonatomic, copy) NSString* slug;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* exploreDescription;
@property (nonatomic, copy) NSURL* URL;

@end
