//
//  SNInteraction.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>


typedef enum : NSInteger {
    SNInteractionActionFollow,
    SNInteractionActionReply,
    SNInteractionActionRepost,
    SNInteractionActionStar,
} SNInteractionAction;

@interface SNInteraction : MTLModel

@property (nonatomic, assign) NSInteger action;
@property (nonatomic, retain) NSArray* objects;
@property (nonatomic, retain) NSArray* users;

@end
