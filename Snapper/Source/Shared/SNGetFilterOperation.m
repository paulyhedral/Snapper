//
//  SNGetFilterOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/22/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNGetFilterOperation.h"

#import "SNFilter.h"

#import "SNAPIUtils.h"


@implementation SNGetFilterOperation

#pragma mark - Initialization

- (id)initWithFilterId:(NSUInteger)filterId
             accountId:(NSString*)accountId
           finishBlock:(void (^)(SNResponse*))finishBlock {

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

    self.endpoint = [[SNAPIUtils sharedAPIUtils] getFilterEndpointURL:_filterId];
    self.serializationRootClass = [SNFilter class];

    [super main];
}

@end
