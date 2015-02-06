//
//  SNPListInteractionsOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"


@interface SNPListInteractionsOperation : SNPBaseUserTokenOperation

// -- Properties --
@property (nonatomic, copy) NSArray* actions;

@end
