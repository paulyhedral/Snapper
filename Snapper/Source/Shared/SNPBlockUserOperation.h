//
//  SNPBlockUserOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 5/12/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <Snapper/Snapper.h>
#import "SNPUserParameters.h"


@interface SNPBlockUserOperation : SNPBaseUserTokenOperation
<SNPUserParameters>

// -- Properties --
@property (nonatomic, assign) NSUInteger userId;

// -- Initialization --
- (id)initWithUserId:(NSUInteger)userId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
