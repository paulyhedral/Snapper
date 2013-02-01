//
//  SNPGetFileOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 1/29/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPGetFileOperation.h"

#import "SNPFile.h"

#import "SNPAPIUtils.h"


@implementation SNPGetFileOperation

#pragma mark - Initializers

- (id)initWithFileId:(NSInteger)fileId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.fileId = fileId;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] getFileEndpointURL:_fileId];
    self.method = @"GET";


    self.serializationRootClass = [SNPFile class];
    
    [super main];
}

@end
