//
//  SNGetUserFolloweesOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNGetUserFolloweesOperation.h"

#import "SNUser.h"

#import "SNAPIUtils.h"


@implementation SNGetUserFolloweesOperation

#pragma mark - Initialization

- (id)initWithUserId:(NSUInteger)userId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNResponse*))finishBlock {

    self = [super init];
    if(self) {
        self.userId = userId;
        self.accountId = accountId;
        self.finishBlock = finishBlock;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNAPIUtils sharedAPIUtils] getUserFolloweesEndpointURL:_userId];
    self.serializationBlock = ^id(NSArray* responseData, NSError** error) {

        NSMutableArray* users = [NSMutableArray new];

        for(NSDictionary* userDict in responseData) {
            SNUser* user = [SNUser modelWithExternalRepresentation:userDict];
            [users addObject:user];
        }

        return users;
    };

    [super main];
}

@end
