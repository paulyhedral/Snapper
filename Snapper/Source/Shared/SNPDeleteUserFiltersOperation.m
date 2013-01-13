//
//  SNPDeleteUserFiltersOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/22/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPDeleteUserFiltersOperation.h"

#import "SNPFilter.h"

#import "SNPAPIUtils.h"


@implementation SNPDeleteUserFiltersOperation

#pragma mark - Initialization

- (id)initWithAccountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super init];
    if(self) {
        self.accountId = accountId;
        self.finishBlock = finishBlock;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] deleteFiltersEndpointURL];
    self.method = @"DELETE";
    self.serializationArrayClass = [SNPFilter class];

    [super main];
}

@end
