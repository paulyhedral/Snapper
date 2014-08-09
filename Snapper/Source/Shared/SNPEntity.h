//
//  SNPEntity.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>


/**
 * Represents a common base class for all entities in an ADN object.
 *
 * Entities that subclass this are SNPMention, SNPHashtag, and SNPLink.
 */
@interface SNPEntity : MTLModel
<MTLJSONSerializing>

@end
