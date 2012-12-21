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

}

- (void)testAccountAccess {

}

@end
