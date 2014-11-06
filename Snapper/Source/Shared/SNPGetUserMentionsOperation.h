//
//  SNPGetUserMentionsOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseStreamOperation.h"
#import "SNPPostParameters.h"


@interface SNPGetUserMentionsOperation : SNPBaseStreamOperation
<SNPPostParameters>

// -- Properties --
@property (nonatomic, assign) NSUInteger userId;

// -- Initialization --
- (instancetype)initWithUserId:(NSUInteger)userId
                     accountId:(NSString*)accountId
                   finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
