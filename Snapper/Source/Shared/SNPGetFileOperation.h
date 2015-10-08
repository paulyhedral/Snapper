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

// -- Initializers --
- (nonnull instancetype)initWithFileId:(NSUInteger)fileId
                             fileToken:(nonnull NSString*)fileToken
                             accountId:(nonnull NSString*)accountId
                           finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
