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

@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSURL* link;
@property (nonatomic, copy) NSString* clientId;

@end
