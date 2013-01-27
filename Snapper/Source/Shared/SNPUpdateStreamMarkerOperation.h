//
//  SNPUpdateStreamMarkerOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserOperation.h"


@interface SNPUpdateStreamMarkerOperation : SNPBaseUserOperation

// -- Properties --
@property (nonatomic, assign) NSUInteger postId;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, assign) NSUInteger percentage;

// -- Initializers --
- (id)initWithPostId:(NSUInteger)postId
                name:(NSString*)name
          percentage:(NSUInteger)percentage
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end