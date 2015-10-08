//
//  SNPBaseImageFetchOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/22/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SNPBaseImageFetchOperation : NSOperation
<NSURLConnectionDelegate>

// -- Properties --
@property (nonatomic, nonnull, retain) NSURL* imageURL;
@property (nonatomic, nonnull, copy) void (^finishBlock)(id _Nullable image, NSError* _Nullable error);
@property (nonatomic, assign) NSTimeInterval timeout;

// -- Initializers --
- (nonnull instancetype)initWithImageURL:(nonnull NSURL*)imageURL
                             finishBlock:(nonnull void (^)(id _Nullable image, NSError* _Nullable error))finishBlock;

@end
