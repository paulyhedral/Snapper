//
//  SNBaseImageFetchOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/22/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#if TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR
#import <UIKit/UIKit.h>
#else
#import <Cocoa/Cocoa.h>
#endif
#import "SNBaseImageFetchOperation.h"


@implementation SNBaseImageFetchOperation {

@private
    NSMutableData* _receivedData;
    NSURLConnection* _connection;
    BOOL _done;

}

#pragma mark - Initializers

- (id)initWithImageURL:(NSURL*)imageURL
           finishBlock:(void (^)(id, NSError*))finishBlock {

    self = [super init];
    if(self) {
        self.imageURL = imageURL;
        self.finishBlock = finishBlock;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    _receivedData = [NSMutableData new];

    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:_imageURL];

    [request addValue:@"image/*"
   forHTTPHeaderField:@"Accept"];

    _connection = [[NSURLConnection alloc] initWithRequest:request
                                                  delegate:self
                                          startImmediately:YES];

    while(!_done &&
          !self.isCancelled) {
        NSDate* futureDate = [NSDate dateWithTimeIntervalSinceNow:5];
        [[NSRunLoop currentRunLoop] runUntilDate:futureDate];
    }
}


#pragma mark - Connection delegate methods

- (void)connection:(NSURLConnection*)connection
willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge*)challenge {

    NSString* authMethod = challenge.protectionSpace.authenticationMethod;

    if([authMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
    }
}

- (void)connection:(NSURLConnection*)connection
didReceiveResponse:(NSURLResponse*)response {

    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
    NSInteger statusCode = httpResponse.statusCode;

    // TODO
}

- (void)connection:(NSURLConnection*)connection
    didReceiveData:(NSData*)data {
    [_receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection*)connection {

#if TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR
    UIImage* image = [[UIImage alloc] initWithData:_receivedData];
    if(_finishBlock) {
        _finishBlock(image, nil);
    }
#else
    NSImage* image = [[NSImage alloc] initWithData:_receivedData];
    if(_finishBlock) {
        _finishBlock(image, nil);
    }
#endif

    _done = YES;
}

- (void)connection:(NSURLConnection*)connection
  didFailWithError:(NSError*)error {

    if(_finishBlock) {
        _finishBlock(nil, error);
    }
    
    _done = YES;
}

@end
