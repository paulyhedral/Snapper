//
//  SNPGetFilesOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 1/29/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"


@interface SNPGetFilesOperation : SNPBaseUserTokenOperation

// -- Properties --
@property (nonatomic, retain) NSArray* fileIds;

// -- Initializers --
- (id)initWithFileIds:(NSArray*)fileIds
            accountId:(NSString*)accountId
          finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
