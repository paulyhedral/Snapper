//
//  SNAccount.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SNAccount : NSObject

// -- Properties --
@property (nonatomic, readonly) NSString* accountId;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* username;
@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, copy) NSString* accessToken;
@property (nonatomic, copy) NSString* tokenType;

// -- Initializers --
- (id)initWithName:(NSString*)name
          username:(NSString*)username
            userId:(NSInteger)userId
       accessToken:(NSString*)accessToken
         tokenType:(NSString*)tokenType;

@end
