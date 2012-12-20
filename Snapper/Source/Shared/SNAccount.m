//
//  SNAccount.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNAccount.h"


@implementation SNAccount

#pragma mark - Initializers

- (id)initWithName:(NSString*)name
          username:(NSString*)username
            userId:(NSInteger)userId
       accessToken:(NSString*)accessToken
         tokenType:(NSString*)tokenType {

    self = [super init];
    if(self) {
        CFUUIDRef uuid = CFUUIDCreate(NULL);
        _accountId = CFBridgingRelease(CFUUIDCreateString(NULL, uuid));
        _name = name;
        _username = username;
        _userId = userId;
        _accessToken = accessToken;
        _tokenType = tokenType;
    }

    return self;
}

@end
