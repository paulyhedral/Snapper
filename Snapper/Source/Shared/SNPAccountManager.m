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
    NSMutableDictionary* _accountIdMap;
    NSMutableDictionary* _accountUserIdMap;

}

CWL_SYNTHESIZE_SINGLETON_FOR_CLASS_WITH_ACCESSOR(SNPAccountManager, sharedAccountManager);

#pragma mark - Initialization

- (instancetype)init {

    self = [super init];
    if(self) {
        _accountIdMap = [NSMutableDictionary new];
        _accountUserIdMap = [NSMutableDictionary new];
    }

    return self;
}


#pragma mark - Public methods

- (SNPAccount*)createAccountWithName:(NSString*)name
                            username:(NSString*)username
                              userId:(NSUInteger)userId
                         accessToken:(NSString*)accessToken
                           tokenType:(NSString*)tokenType {

    //    NSAssert(username, @"Account username must not be nil!");
    NSAssert(accessToken, @"Account access token must not be nil");
    NSAssert(tokenType, @"Account token type must not be nil");

    SNPAccount* account = _accountUserIdMap[@(userId)];
    if(account)
        return account;

    account = [[SNPAccount alloc] initWithName:name
                                      username:username
                                        userId:userId
                                   accessToken:accessToken
                                     tokenType:tokenType];

    if(account) {
        _accountIdMap[account.accountId] = account;
        _accountUserIdMap[@(userId)] = account;
    }

    return account;
}

- (void)removeAccountForId:(NSString*)accountId {
    SNPAccount* account = _accountIdMap[accountId];
    if(account) {
        [_accountUserIdMap removeObjectForKey:@(account.userId)];
    }
    [_accountIdMap removeObjectForKey:accountId];
}

- (SNPAccount*)accountForId:(NSString*)accountId {
    return _accountIdMap[accountId];
}

- (SNPAccount *)accountForUserId:(NSUInteger)userId {
    return _accountUserIdMap[@(userId)];
}

- (NSArray*)allAccounts {
    return [_accountIdMap allValues];
}

@end
