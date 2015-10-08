//
//  SNPAccount.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SNPAccount : NSObject

// -- Properties --
@property (nonatomic, nonnull, readonly) NSString* accountId;
@property (nonatomic, nonnull, copy) NSString* name;
@property (nonatomic, nonnull, copy) NSString* username;
@property (nonatomic, assign) NSUInteger userId;
@property (nonatomic, nonnull, copy) NSString* accessToken;
@property (nonatomic, nonnull, copy) NSString* tokenType;

// -- Initializers --
- (nonnull instancetype)initWithName:(nonnull NSString*)name
                            username:(nonnull NSString*)username
                              userId:(NSUInteger)userId
                         accessToken:(nonnull NSString*)accessToken
                           tokenType:(nonnull NSString*)tokenType;

@end
