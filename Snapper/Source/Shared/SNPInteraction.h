//
//  SNPInteraction.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>


typedef enum : NSInteger {
    SNPInteractionActionFollow,
    SNPInteractionActionReply,
    SNPInteractionActionRepost,
    SNPInteractionActionStar,
} SNPInteractionAction;

@interface SNPInteraction : MTLModel

@property (nonatomic, assign) SNPInteractionAction action;
@property (nonatomic, retain) NSArray* objects;
@property (nonatomic, retain) NSArray* users;

@end
