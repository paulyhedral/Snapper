//
//  SNPSetFileContentOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 1/29/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <Snapper/Snapper.h>
#import "SNPFileParameters.h"


@interface SNPSetFileContentOperation : SNPBaseUserTokenOperation
<SNPFileParameters>

// -- Properties --
@property (nonatomic, assign) NSInteger fileId;
@property (nonatomic, nonnull, retain) NSData* data;

// -- Initializers --
- (nonnull instancetype)initWithFileId:(NSUInteger)fileId
                                  data:(nonnull NSData*)data
                             accountId:(nonnull NSString*)accountId
                           finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
