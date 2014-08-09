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
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, assign) BOOL defaultImage;

@end
