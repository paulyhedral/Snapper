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

- (id)initWithFileIds:(NSArray*)fileIds
            accountId:(NSString*)accountId
          finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.fileIds = fileIds;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] getFilesEndpointURL];

    NSString* fileIdsString = [_fileIds componentsJoinedByString:@","];
    self.parameters = (@{
                       @"ids" : fileIdsString,
                       });

    self.serializationArrayClass = [SNPFile class];

    [super main];
}

@end
