//
//  SNPUpdateFilterOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/22/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPUpdateFilterOperation.h"

#import "SNPAPIUtils.h"


@implementation SNPUpdateFilterOperation

#pragma mark - Initialization

- (id)initWithFilterId:(NSUInteger)filterId
                  name:(NSString*)name
           matchPolicy:(SNPFilterMatchPolicy)matchPolicy
               clauses:(NSArray*)clauses
             accountId:(NSString*)accountId
           finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super init];
    if(self) {
        self.filterId = filterId;
        self.name = name;
        self.matchPolicy = matchPolicy;
        self.clauses = clauses;
        self.accountId = accountId;
        self.finishBlock = finishBlock;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] updateFilterEndpointURL:_filterId];
    self.method = @"PUT";

    SNPFilter* filter = [SNPFilter new];
    filter.name = _name;
    filter.matchPolicy = _matchPolicy;
    filter.clauses = _clauses;

    NSDictionary* filterDict = [filter externalRepresentation];

    NSError* error = nil;
    NSData* bodyData = [NSJSONSerialization dataWithJSONObject:filterDict
                                                       options:0
                                                         error:&error];
    if(bodyData == nil) {
        SNPResponse* response = [self createResponseFromError:error];
        if(self.finishBlock) {
            self.finishBlock(response);
        }
        return;
    }

    self.body = bodyData;
    self.bodyType = @"application/json";

    self.serializationRootClass = [SNPFilter class];

    [super main];
}

@end
