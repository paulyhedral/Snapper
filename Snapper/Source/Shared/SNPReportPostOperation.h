//
//  SNPReportPostOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 2/14/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <Snapper/Snapper.h>
#import "SNPPostParameters.h"


@interface SNPReportPostOperation : SNPBaseUserTokenOperation
<SNPPostParameters>

// -- Properties --
@property (nonatomic, assign) NSInteger postId;

// -- Initializers --
- (nonnull instancetype)initWithPostId:(NSUInteger)postId
                             accountId:(nonnull NSString*)accountId
                           finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
