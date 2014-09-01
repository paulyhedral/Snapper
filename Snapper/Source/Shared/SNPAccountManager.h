//
//  SNPAccountManager.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CWLSynthesizeSingleton.h"

#import "SNPAccount.h"


@interface SNPAccountManager : NSObject

CWL_DECLARE_SINGLETON_FOR_CLASS_WITH_ACCESSOR(SNPAccountManager, sharedAccountManager)

- (SNPAccount*)createAccountWithName:(NSString*)name
                           username:(NSString*)username
                             userId:(NSUInteger)userId
                        accessToken:(NSString*)accessToken
                          tokenType:(NSString*)tokenType;
- (void)removeAccountForId:(NSString*)accountId;
- (SNPAccount*)accountForId:(NSString*)accountId;
- (SNPAccount*)accountForUserId:(NSUInteger)userId;
- (NSArray*)allAccounts;

@end
