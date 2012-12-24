//
//  MiscellaneousTests.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "MiscellaneousTests.h"

#import "SNAPIUtils.h"


@implementation MiscellaneousTests

- (void)testEndpointConstruction {

    SNAPIUtils* apiUtils = [SNAPIUtils sharedAPIUtils];

    NSString* rootURL = @"http://test-api";
    apiUtils.rootAPIURL = [NSURL URLWithString:rootURL];

    NSURL* apiURL = [apiUtils getUserEndpointURL:1];

    NSString* rootURLSubstring = [[apiURL absoluteString] substringToIndex:[rootURL length]];
    STAssertTrue([rootURLSubstring isEqualToString:rootURL], @"Constructed API URL doesn't contain the root we set");
}

@end
