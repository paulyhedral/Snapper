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

@property (nonatomic, nonnull, copy) NSString* text;
@property (nonatomic, nonnull, copy) NSString* html;
@property (nonatomic, nonnull, copy) NSArray* mentions;
@property (nonatomic, nonnull, copy) NSArray* hashtags;
@property (nonatomic, nonnull, copy) NSArray* links;

@end
