//
//  SNPReportPostOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 2/14/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <Snapper/Snapper.h>


@interface SNPReportPostOperation : SNPBaseUserOperation

// -- Properties --
@property (nonatomic, assign) NSInteger postId;

// -- Initializers --
- (id)initWithPostId:(NSUInteger)postId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
