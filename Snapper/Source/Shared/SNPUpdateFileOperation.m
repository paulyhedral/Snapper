//
//  SNPUpdateFileOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 1/29/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPUpdateFileOperation.h"


@implementation SNPUpdateFileOperation

#pragma mark - Initializers

- (id)initWithFileId:(NSInteger)fileId
                name:(NSString*)name
         annotations:(NSArray*)annotations
         accountId:(NSString*)accountId
       finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super init];
    if(self) {
        self.fileId = fileId;
        self.name = name;
        self.annotations = annotations;
        self.accountId = accountId;
        self.finishBlock = finishBlock;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] updateFileEndpointURL:_fileId];
    self.method = @"PUT";

    SNPFile* file = [SNPFile new];
    file.fileId = _fileId;
    file.name = _name;
    file.annotations = _annotations;

    NSDictionary* fileDict = [file externalRepresentation];

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
