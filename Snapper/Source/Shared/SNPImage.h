//
//  SNPImage.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>


@interface SNPImage : MTLModel
<MTLJSONSerializing>

@property (nonatomic, copy) NSURL* URL;
@property (nonatomic, assign) NSUInteger width;
@property (nonatomic, assign) NSUInteger height;
@property (nonatomic, assign, getter=isDefaultImage) BOOL defaultImage;

@end
