//
//  SNPBaseMessageOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 3/26/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"


@interface SNPBaseMessageOperation : SNPBaseUserTokenOperation

// -- Properties --
@property (nonatomic, copy) NSArray* channelTypes;
@property (nonatomic, assign) BOOL includeMessageAnnotations;

@end
