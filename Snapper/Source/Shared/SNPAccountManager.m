//
//  SNPAccountManager.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPAccountManager.h"


@implementation SNPAccountManager {

@private
    NSMutableDictionary* _accounts;

}

CWL_SYNTHESIZE_SINGLETON_FOR_CLASS_WITH_ACCESSOR(SNPAccountManager, sharedAccountManager);

#pragma mark - Initialization

- (id)init {

    self = [super init];
    if(self) {
        _accounts = [NSMutableDictionary new];
    }

    return self;
}


#pragma mark - Public methods

- (SNPAccount*)createAccountWithName:(NSString*)name
                           username:(NSString*)username
                             userId:(NSInteger)userId
                        accessToken:(NSString*)accessToken
                          tokenType:(NSString*)tokenType {

    NSAssert(username, @"Account username must not be nil!");
    NSAssert(accessToken, @"Account access token must not be nil");

    SNPAccount* account = [[SNPAccount alloc] initWithName:name
                                                username:username
                                                  userId:userId
                                             accessToken:accessToken
                                               tokenType:tokenType];

    _accounts[account.accountId] = account;

    return account;
}

- (void)removeAccountForId:(NSString*)accountId {
    [_accounts removeObjectForKey:accountId];
}

- (SNPAccount*)accountForId:(NSString*)accountId {
    return _accounts[accountId];
}

- (NSArray*)allAccounts {
    return [_accounts allValues];
}

@end
