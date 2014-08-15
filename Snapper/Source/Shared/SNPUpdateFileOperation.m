//
//  SNPUpdateFileOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 1/29/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPUpdateFileOperation.h"

#import "SNPAPIUtils.h"


@implementation SNPUpdateFileOperation

#pragma mark - Initializers

- (id)initWithFileId:(NSInteger)fileId
                name:(NSString*)name
         annotations:(NSArray*)annotations
         accountId:(NSString*)accountId
       finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.fileId = fileId;
        self.name = name;
        self.annotations = annotations;
        self.method = @"PUT";
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] updateFileEndpointURL:_fileId];

    SNPFile* file = [SNPFile new];
    file.fileId = _fileId;
    file.name = self.name;
    file.annotations = _annotations;

    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:file];
    NSDictionary* fileDict = [adapter JSONDictionary];

    NSError* error = nil;
    NSData* bodyData = [NSJSONSerialization dataWithJSONObject:fileDict
                                                       options:0
                                                         error:&error];
    if(bodyData == nil) {
        SNPResponse* response = [self createResponseFromError:error];
        if(self.finishBlock) {
            self.finishBlock(response);
        }
        return;
    }

    self.body = bodyData;
    self.bodyType = @"application/json";

    self.serializationRootClass = [SNPFile class];

    [super main];
}

@end
