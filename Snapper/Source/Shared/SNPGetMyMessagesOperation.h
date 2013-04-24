//
//  SNPGetMyMessagesOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 4/15/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseMessageOperation.h"
#import "SNPMessageParameters.h"
#import "SNPPaginationParameters.h"


@interface SNPGetMyMessagesOperation : SNPBaseMessageOperation
<SNPPaginationParameters>

@end
