//
//  SNPChannel.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>

#import "SNPUser.h"


@interface SNPChannel : MTLModel

@property (nonatomic, assign) BOOL hasUnread;
@property (nonatomic, assign) NSInteger channelId;
@property (nonatomic, retain) SNPUser* owner;
@property (nonatomic, assign) BOOL readersAnyUser;
@property (nonatomic, assign) BOOL readersImmutable;
@property (nonatomic, assign) BOOL readersPublic;
@property (nonatomic, retain) NSArray* readersUserIds;
@property (nonatomic, assign) BOOL readersYou;
@property (nonatomic, assign) NSInteger recentMessageId;
@property (nonatomic, copy) NSString* type;
@property (nonatomic, assign) BOOL writersAnyUser;
@property (nonatomic, assign) BOOL writersImmutable;
@property (nonatomic, assign) BOOL writersPublic;
@property (nonatomic, retain) NSArray* writersUserIds;
@property (nonatomic, assign) BOOL writersYou;
@property (nonatomic, assign) BOOL youCanEdit;
@property (nonatomic, assign) BOOL youSubscribed;

@end
