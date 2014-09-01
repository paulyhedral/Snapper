//
//  SNPCreateFilterOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/22/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPCreateFilterOperation.h"

#import "SNPAPIUtils.h"


@implementation SNPCreateFilterOperation

#pragma mark - Initialization

- (instancetype)initWithName:(NSString*)name
       matchPolicy:(SNPFilterMatchPolicy)matchPolicy
           clauses:(NSArray*)clauses
         accountId:(NSString*)accountId
       finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.name = name;
        self.matchPolicy = matchPolicy;
        self.clauses = clauses;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] createFilterEndpointURL];
    self.method = @"POST";

    SNPFilter* filter = [SNPFilter new];
    filter.name = self.name;
    filter.matchPolicy = _matchPolicy;
    filter.clauses = _clauses;

    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:filter];
    NSDictionary* filterDict = [adapter JSONDictionary];

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
