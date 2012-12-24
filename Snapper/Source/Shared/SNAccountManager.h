//
//  SNAccountManager.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CWLSynthesizeSingleton.h"

#import "SNAccount.h"


@interface SNAccountManager : NSObject

CWL_DECLARE_SINGLETON_FOR_CLASS_WITH_ACCESSOR(SNAccountManager, sharedAccountManager)

- (SNAccount*)createAccountWithName:(NSString*)name
                           username:(NSString*)username
                             userId:(NSInteger)userId
                        accessToken:(NSString*)accessToken
                          tokenType:(NSString*)tokenType;
- (void)removeAccountForId:(NSString*)accountId;
- (SNAccount*)accountForId:(NSString*)accountId;
- (NSArray*)allAccounts;

@end
