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

- (id)initWithFilterId:(NSUInteger)filterId
             accountId:(NSString*)accountId
           finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super init];
    if(self) {
        self.filterId = filterId;
        self.accountId = accountId;
        self.finishBlock = finishBlock;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] deleteFilterEndpointURL:_filterId];
    self.method = @"DELETE";
    self.serializationRootClass = [SNPFilter class];

    [super main];
}

@end
