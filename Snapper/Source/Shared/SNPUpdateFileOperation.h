//
//  SNPUpdateFileOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 1/29/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"
#import "SNPFile.h"
#import "SNPFileParameters.h"


@interface SNPUpdateFileOperation : SNPBaseUserTokenOperation
<SNPFileParameters>

// -- Properties --
@property (nonatomic, assign) NSInteger fileId;
@property (nonatomic, nonnull, copy) NSString* fullname;
@property (nonatomic, nullable, retain) NSArray* annotations;

// -- Initializers --
- (nonnull instancetype)initWithFileId:(NSUInteger)fileId
                                  name:(nonnull NSString*)name
                           annotations:(nullable NSArray*)annotations
                             accountId:(nonnull NSString*)accountId
                           finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
