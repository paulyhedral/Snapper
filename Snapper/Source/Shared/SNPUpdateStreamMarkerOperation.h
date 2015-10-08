//
//  SNPUpdateStreamMarkerOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"


@interface SNPUpdateStreamMarkerOperation : SNPBaseUserTokenOperation

// -- Properties --
@property (nonatomic, assign) NSUInteger postId;
@property (nonatomic, nonnull, copy) NSString* fullname;
@property (nonatomic, assign) NSUInteger percentage;

@property (nonatomic, assign) BOOL resetReadId;

// -- Initializers --
- (nonnull instancetype)initWithPostId:(NSUInteger)postId
                                  name:(nonnull NSString*)name
                            percentage:(NSUInteger)percentage
                             accountId:(nonnull NSString*)accountId
                           finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
