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

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.fileId = fileId;
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] deleteFileEndpointURL:fileId];
        self.method = @"DELETE";
        self.serializationRootClass = [SNPFile class];
    }

    return self;
}

@end
