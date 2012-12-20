//
//  SNStreamMarker.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>


@interface SNStreamMarker : MTLModel

@property (nonatomic, assign) NSInteger postId;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, assign) NSInteger percentage;
@property (nonatomic, retain) NSDate* updatedAt;
@property (nonatomic, copy) NSString* version;

@end
