//
//  SNPGetMyFilesOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 1/29/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"
#import "SNPFileParameters.h"
#import "SNPPaginationParameters.h"


@interface SNPGetMyFilesOperation : SNPBaseUserTokenOperation
<SNPFileParameters, SNPPaginationParameters>

// -- Properties --

// -- Initializers --
- (nonnull instancetype)initWithAccountId:(nonnull NSString*)accountId
                              finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
