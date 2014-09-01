//
//  SNPGetFileOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 1/29/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseFileOperation.h"
#import "SNPFileParameters.h"


@interface SNPGetFileOperation : SNPBaseFileOperation
<SNPFileParameters>

// -- Properties --
@property (nonatomic, assign) NSInteger fileId;
@property (nonatomic, copy) NSString* fileToken;

// -- Initializers --
- (instancetype)initWithFileId:(NSUInteger)fileId
           fileToken:(NSString*)fileToken
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
