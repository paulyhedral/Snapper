//
//  SNGetUsersOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNGetUsersOperation.h"

#import "SNUser.h"

#import "SNAPIUtils.h"


@implementation SNGetUsersOperation

- (id)initWithUserIds:(NSArray*)userIds
            accountId:(NSString*)accountId
          finishBlock:(void (^)(SNResponse *))finishBlock {

    self = [super init];
    if(self) {
        self.endpoint = [[SNAPIUtils sharedAPIUtils] getUsersEndpointURL];
        self.userIds = userIds;
        self.accountId = accountId;
    }

    return self;
}

- (void)main {

    NSString* userIdsString = [_userIds componentsJoinedByString:@","];
    self.parameters = (@{
                       @"user_ids" : userIdsString,
                       });
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
