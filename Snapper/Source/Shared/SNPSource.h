//
//  SNPSource.h
//  Snapper
//
//  Created by Paul Schifferer on 1/28/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>


@interface SNPSource : MTLModel
<MTLJSONSerializing>

@property (nonatomic, nonnull, copy) NSString* name;
@property (nonatomic, nonnull, copy) NSURL* link;
@property (nonatomic, nonnull, copy) NSString* clientId;

@end
