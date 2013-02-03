//
//  SNPGetFilterOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/22/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetFilterOperation.h"

#import "SNPFilter.h"

#import "SNPAPIUtils.h"


@implementation SNPGetFilterOperation

#pragma mark - Initialization

- (id)initWithFilterId:(NSUInteger)filterId
             accountId:(NSString*)accountId
           finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.filterId = filterId;
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] getFilterEndpointURL:filterId];
        self.serializationRootClass = [SNPFilter class];
    }

    return self;
}

@end
