//
//  ModelTests.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "ModelTests.h"

#import <Snapper/Snapper.h>


@implementation ModelTests {

@private
    NSDictionary* _userDict;

}

- (void)setUp {
    [super setUp];

    NSBundle* bundle = [NSBundle bundleForClass:[self class]];
    NSString *filePath = [bundle pathForResource:@"user"
                                          ofType:@"json"];
    NSData* data = [[NSData alloc] initWithContentsOfFile:filePath];
    STAssertNotNil(data, @"No data loaded from file: %@", filePath);
    NSError* error = nil;
    _userDict = [NSJSONSerialization JSONObjectWithData:data
                                                options:0
                                                  error:&error];
    STAssertNotNil(_userDict, @"Unable to convert JSON data to dictionary: %@", error);
}

- (void)testUserFromJSON {

    SNUser* user = [SNUser modelWithExternalRepresentation:_userDict];
    STAssertNotNil(user, @"Unable to create user from JSON");

    STAssertTrue(user.userId == 1199, @"User ID should be 1199");
    STAssertTrue([user.username isEqualToString:@"pilgrim"], @"Username should be 'pilgrim'");
    STAssertTrue([user.annotations count] == 9, @"User should have 9 annotations");
    STAssertTrue([user.description.links count] == 2, @"User's description should have 2 link entities");
    STAssertTrue([user.createdAt timeIntervalSince1970] > 0, @"User's created date should not be 0");
    STAssertTrue(user.postsCount == 4077, @"User should have 4077 posts");
    STAssertNotNil(user.avatarImage, @"User should have an avatar image");
    STAssertNotNil(user.avatarImage.URL, @"User should have an avatar image URL");
    STAssertNotNil(user.coverImage, @"User should have a cover image");
    STAssertNotNil(user.coverImage.URL, @"User should have a cover image URL");
    STAssertTrue([[user.canonicalURL absoluteString] isEqualToString:@"https://alpha.app.net/pilgrim"], @"User's canonical URL is not set correctly");
}

@end
