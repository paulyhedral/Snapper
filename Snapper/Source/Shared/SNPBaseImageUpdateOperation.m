//
//  SNPBaseImageUpdateOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 1/13/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseImageUpdateOperation.h"

#if TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR
#import <UIKit/UIKit.h>
#else
#import <Cocoa/Cocoa.h>
#endif

#import "SNPUser.h"

#import "SNPAPIUtils.h"


@implementation SNPBaseImageUpdateOperation

#pragma mark - Initializers

- (id)initWithImage:(id)image
          accountId:(NSString*)accountId
        finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.image = image;
        self.method = @"POST";        
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    NSMutableData* bodyData = [NSMutableData new];

    NSTimeInterval now = [NSDate timeIntervalSinceReferenceDate];
    NSString* boundaryString = [NSString stringWithFormat:@"update_image_boundary_%.0f", now];

    NSString* openingBoundary = [NSString stringWithFormat:@"--%@\r\n",
                                 boundaryString];
    [bodyData appendData:[openingBoundary dataUsingEncoding:NSUTF8StringEncoding]];

    NSData* imageData = nil;
#if TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR
    imageData = UIImagePNGRepresentation(_image);
#else
    NSArray* representations = [(NSImage*)_image representations];
    imageData = [NSBitmapImageRep representationOfImageRepsInArray:representations
                                                         usingType:NSPNGFileType
                                                        properties:nil];
#endif
    [bodyData appendData:imageData];

    NSString* closingBoundary = [NSString stringWithFormat:@"--%@--\r\n",
                                 boundaryString];
    [bodyData appendData:[closingBoundary dataUsingEncoding:NSUTF8StringEncoding]];

    self.body = bodyData;
    self.bodyType = [NSString stringWithFormat:@"multipart/form-data; boundary=\"%@\"", boundaryString];

    self.serializationRootClass = [SNPUser class];
    
    [super main];
}

@end
