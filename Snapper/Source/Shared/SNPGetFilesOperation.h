//
//  SNPGetFilesOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 1/29/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"
#import "SNPFileParameters.h"


@interface SNPGetFilesOperation : SNPBaseUserTokenOperation
<SNPFileParameters>

// -- Properties --
@property (nonatomic, nonnull, retain) NSArray* fileIds;

// -- Initializers --
- (nonnull instancetype)initWithFileIds:(nonnull NSArray*)fileIds
                              accountId:(nonnull NSString*)accountId
                            finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
