//
//  SNAccountManager.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNAccountManager.h"


@implementation SNAccountManager {

@private
    NSMutableDictionary* _accounts;

}

CWL_SYNTHESIZE_SINGLETON_FOR_CLASS_WITH_ACCESSOR(SNAccountManager, sharedAccountManager);

- (SNAccount*)createAccountWithName:(NSString*)name
                           username:(NSString*)username
                             userId:(NSInteger)userId
                        accessToken:(NSString*)accessToken
                          tokenType:(NSString*)tokenType {

    NSAssert(username, @"Account username must not be nil!");
    NSAssert(accessToken, @"Account access token must not be nil");

    SNAccount* account = [[SNAccount alloc] initWithName:name
                                                username:username
                                                  userId:userId
                                             accessToken:accessToken
                                               tokenType:tokenType];

    return account;
}

- (void)removeAccountForId:(NSString*)accountId {
    [_accounts removeObjectForKey:accountId];
}

- (SNAccount*)accountForId:(NSString*)accountId {
    return _accounts[accountId];
}

@end
