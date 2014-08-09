//
//  SNPInteraction.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>


typedef NS_ENUM(NSInteger, SNPInteractionAction) {
    SNPInteractionActionFollow,
    SNPInteractionActionReply,
    SNPInteractionActionRepost,
    SNPInteractionActionStar,
    SNPInteractionActionWelcome,
    SNPInteractionActionBroadcastCreate,
    SNPInteractionActionBroadcastSubscribe,
    SNPInteractionActionBroadcastUnsubscribe,
};

@interface SNPInteraction : MTLModel
<MTLJSONSerializing>

@property (nonatomic, assign) SNPInteractionAction action;
@property (nonatomic, retain) NSArray* objects;
@property (nonatomic, retain) NSArray* users;
@property (nonatomic, copy) NSDate* eventDate;

@end
