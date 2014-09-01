//
//  SNPDeleteFilterOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/22/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPDeleteFilterOperation.h"

#import "SNPFilter.h"

#import "SNPAPIUtils.h"


@implementation SNPDeleteFilterOperation

#pragma mark - Initialization

- (instancetype)initWithFilterId:(NSUInteger)filterId
             accountId:(NSString*)accountId
           finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.filterId = filterId;
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] deleteFilterEndpointURL:filterId];
        self.method = @"DELETE";
        self.serializationRootClass = [SNPFilter class];
    }

    return self;
}

@end
