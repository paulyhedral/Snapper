//
//  SNPUpdateFileOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 1/29/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"

#import "SNPFile.h"


@interface SNPUpdateFileOperation : SNPBaseUserTokenOperation

// -- Properties --
@property (nonatomic, assign) NSInteger fileId;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, retain) NSArray* annotations;

// -- Initializers --
- (id)initWithFileId:(NSInteger)fileId
                name:(NSString*)name
         annotations:(NSArray*)annotations
         accountId:(NSString*)accountId
       finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
