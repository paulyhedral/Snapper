//
//  SNPGetFilesOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 1/29/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPGetFilesOperation.h"

#import "SNPFile.h"

#import "SNPAPIUtils.h"


@implementation SNPGetFilesOperation

#pragma mark - Initialization

- (instancetype)initWithFileIds:(NSArray*)fileIds
            accountId:(NSString*)accountId
          finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.fileIds = fileIds;
        self.endpoint = [[SNPAPIUtils sharedInstance] getFilesEndpointURL];
        self.serializationArrayClass = [SNPFile class];
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    NSString* fileIdsString = [_fileIds componentsJoinedByString:@","];
    self.parameters = (@{
                       @"ids" : fileIdsString,
                       });

    [super main];
}

@end
