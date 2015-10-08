//
//  SNPSearchUsersOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseStreamOperation.h"
#import "SNPUserParameters.h"
#import "SNPPaginationParameters.h"


@interface SNPSearchUsersOperation : SNPBaseStreamOperation
<SNPUserParameters, SNPPaginationParameters>

// -- Properties --
@property (nonatomic, nonnull, copy) NSString* queryString;

// -- Initialization --
- (nonnull instancetype)initWithQueryString:(nonnull NSString*)queryString
                                  accountId:(nonnull NSString*)accountId
                                finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
