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


NS_ASSUME_NONNULL_BEGIN

@interface SNPAccountManager : NSObject

CWL_DECLARE_SINGLETON_FOR_CLASS_WITH_ACCESSOR(SNPAccountManager, sharedInstance)

- (nullable SNPAccount*)createAccountWithName:(nonnull NSString*)name
                            username:(nonnull NSString*)username
                              userId:(NSUInteger)userId
                         accessToken:(nonnull NSString*)accessToken
                           tokenType:(nonnull NSString*)tokenType;
- (void)removeAccountForId:(nonnull NSString*)accountId;
- (nullable SNPAccount*)accountForId:(nonnull NSString*)accountId;
- (nullable SNPAccount*)accountForUserId:(NSUInteger)userId;
- (nonnull NSArray*)allAccounts;

@end

NS_ASSUME_NONNULL_END
