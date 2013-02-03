//
//  SNPSetFileContentOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 1/29/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPSetFileContentOperation.h"

#import "SNPFile.h"

#import "SNPAPIUtils.h"


@implementation SNPSetFileContentOperation

#pragma mark - Initializers

- (id)initWithFileId:(NSInteger)fileId
                data:(NSData*)data
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.fileId = fileId;
        self.data = data;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] updateFileContentEndpointURL:_fileId];
    self.method = @"PUT";

    NSMutableData* bodyData = [NSMutableData new];

    NSTimeInterval now = [NSDate timeIntervalSinceReferenceDate];
    NSString* boundaryString = [NSString stringWithFormat:@"update_content_boundary_%.0f", now];

    NSString* fileHeader = [NSString stringWithFormat:@"--%@\r\n\r\n",
                            boundaryString];
    [bodyData appendData:[fileHeader dataUsingEncoding:NSUTF8StringEncoding]];
    [bodyData appendData:_data];

    NSString* closingBoundary = [NSString stringWithFormat:@"--%@--\r\n",
                                 boundaryString];
    [bodyData appendData:[closingBoundary dataUsingEncoding:NSUTF8StringEncoding]];

    self.body = bodyData;
    self.bodyType = [NSString stringWithFormat:@"multipart/form-data; boundary=\"%@\"", boundaryString];

    self.serializationRootClass = [SNPFile class];

    [super main];
}

@end
