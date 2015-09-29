//
//  SNPResponse.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

@import Foundation;
#import "SNPMetadata.h"


@interface SNPResponse : NSObject

@property (nonatomic, nonnull, retain) id data;
@property (nonatomic, nonnull, retain) SNPMetadata* metadata;

@end
