//
//  SNDeleteUserFiltersOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/22/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNBaseOAuthOperation.h"


@interface SNDeleteUserFiltersOperation : SNBaseOAuthOperation

// -- Initialization --
- (id)initWithAccountId:(NSString*)accountId
            finishBlock:(void (^)(SNResponse* response))finishBlock;

@end
