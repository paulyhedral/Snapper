//
//  SNPDeleteFileOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 1/29/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPDeleteFileOperation.h"

#import "SNPFile.h"

#import "SNPAPIUtils.h"


@implementation SNPDeleteFileOperation

#pragma mark - Initializers

- (id)initWithFileId:(NSInteger)fileId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super init];
    if(self) {
        self.fileId = fileId;
        self.accountId = accountId;
        self.finishBlock = finishBlock;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] deleteFileEndpointURL:_fileId];
    self.method = @"DELETE";
    self.serializationRootClass = [SNPFile class];
    
    [super main];
}

@end
