//
//  SNGetUserFiltersOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/22/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNGetUserFiltersOperation.h"

#import "SNFilter.h"

#import "SNAPIUtils.h"


@implementation SNGetUserFiltersOperation

#pragma mark - Initialization

- (id)initWithAccountId:(NSString*)accountId
            finishBlock:(void (^)(SNResponse* response))finishBlock {

    self = [super init];
    if(self) {
        self.accountId = accountId;
        self.finishBlock = finishBlock;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNAPIUtils sharedAPIUtils] getFiltersEndpointURL];
    self.serializationArrayClass = [SNFilter class];

    [super main];
}


@end
