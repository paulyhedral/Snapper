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
           fileToken:(NSString*)fileToken
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.fileId = fileId;
        self.fileToken = fileToken;
        self.endpoint = [[SNPAPIUtils sharedAPIUtils] getFileEndpointURL:fileId];
        self.method = @"GET";
        self.serializationRootClass = [SNPFile class];
    }

    return self;
}

- (void)main {

    [self handleFileParameters];

    [super main];
}

@synthesize includeAnnotations = _includeAnnotations;
@synthesize includeUserAnnotations = _includeUserAnnotations;

@synthesize fileTypes = _fileTypes;
@synthesize includeIncomplete = _includeIncomplete;
@synthesize includePrivate = _includePrivate;
@synthesize includeFileAnnotations = _includeFileAnnotations;

- (void)handleFileParameters {

    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];

    if(self.parameters) {
        [parameters addEntriesFromDictionary:self.parameters];
    }

    if(_fileTypes) {
        parameters[@"include_annotations"] = [_fileTypes componentsJoinedByString:@","];
    }
    if(_includeIncomplete) {
        parameters[@"include_incomplete"] = @"1";
    }
    if(_includePrivate) {
        parameters[@"include_private"] = @"1";
    }
    if(_includeFileAnnotations) {
        parameters[@"include_file_annotations"] = @"1";
    }
    if(_includeAnnotations) {
        parameters[@"include_annotations"] = @"1";
    }
    if(_includeUserAnnotations) {
        parameters[@"include_user_annotations"] = @"1";
    }

    if([[parameters allKeys] count]) {
        self.parameters = parameters;
    }
}

@end
