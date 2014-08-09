//
//  SNPDescription.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>


@interface SNPDescription : MTLModel
<MTLJSONSerializing>

@property (nonatomic, copy) NSString* text;
@property (nonatomic, copy) NSString* html;
@property (nonatomic, retain) NSArray* mentions;
@property (nonatomic, retain) NSArray* hashtags;
@property (nonatomic, retain) NSArray* links;

@end
