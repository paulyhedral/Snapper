//
//  SNPSetFileContentOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 1/29/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <Snapper/Snapper.h>


@interface SNPSetFileContentOperation : SNPBaseUserTokenOperation

// -- Properties --
@property (nonatomic, assign) NSInteger fileId;
@property (nonatomic, retain) NSData* data;

// -- Initializers --
- (id)initWithFileId:(NSInteger)fileId
                data:(NSData*)data
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
