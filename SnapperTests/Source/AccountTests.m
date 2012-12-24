//
//  AccountTests.m
//  SnapperTests
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "AccountTests.h"

#import <Snapper/Snapper.h>


@implementation AccountTests

- (void)setUp {
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown {
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testAccountCreation {

    SNAccount* account = [[SNAccountManager sharedAccountManager] createAccountWithName:@"Test Account"
                                                                               username:@"test"
                                                                                 userId:86
                                                                            accessToken:@"12345"
                                                                              tokenType:@"Bearer"];

    STAssertNotNil(account, @"Account couldn't be created");
    STAssertNotNil(account.accountId, @"Account ID isn't set for newly created account");
    STAssertTrue([account.username isEqualToString:@"test"], @"Created account's username doesn't match 'test'");
}

- (void)testAccountRemoval {

    SNAccountManager* accountManager = [SNAccountManager sharedAccountManager];

    NSString* accountId = nil;
    {
        SNAccount* newAccount = [accountManager createAccountWithName:@"Bogus Account"
                                                             username:@"bogus"
                                                               userId:42
                                                          accessToken:@"54321"
                                                            tokenType:@"Bearer"];

        STAssertNotNil(newAccount, @"New account should not be nil");
        STAssertNotNil(newAccount.accountId, @"New account's accountId should not be nil");
        accountId = newAccount.accountId;
    }

    [accountManager removeAccountForId:accountId];

    SNAccount* account = [[SNAccountManager sharedAccountManager] accountForId:accountId];
    STAssertNil(account, @"Account should be nil for account ID '%@'", accountId);
}

- (void)testAccountAccess {

    SNAccountManager* accountManager = [SNAccountManager sharedAccountManager];

    NSString* accountId = nil;
    {
        SNAccount* newAccount = [accountManager createAccountWithName:@"Bogus Account"
                                                             username:@"bogus"
                                                               userId:42
                                                          accessToken:@"54321"
                                                            tokenType:@"Bearer"];

        STAssertNotNil(newAccount, @"New account should not be nil");
        STAssertNotNil(newAccount.accountId, @"New account's accountId should not be nil");
        accountId = newAccount.accountId;
    }

    SNAccount* account = [[SNAccountManager sharedAccountManager] accountForId:accountId];
    STAssertNotNil(account, @"Account should not be nil for account ID '%@'", accountId);

    STAssertTrue(account.username isEqualToString:@"bogus", @"Account's username should be 'bogus'");
    STAssertTrue(account.userId == 42, @"Account's user ID should be 42");
    STAssertTrue(account.accessToken isEqualToString:@"54321", @"Account's access token should be '54321'");
}

@end
