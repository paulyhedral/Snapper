//
//  SNPAccount.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPAccount.h"


@implementation SNPAccount

#pragma mark - Initializers

- (instancetype)initWithName:(NSString*)name
                    username:(NSString*)username
                      userId:(NSUInteger)userId
                 accessToken:(NSString*)accessToken
                   tokenType:(NSString*)tokenType {

    self = [super init];
    if(self) {
        NSUUID* uuid = [NSUUID UUID];
        _accountId = [uuid UUIDString];
        _name = name;
        _username = username;
        _userId = userId;
        _accessToken = accessToken;
        _tokenType = tokenType;
    }
    
    return self;
}

@end
