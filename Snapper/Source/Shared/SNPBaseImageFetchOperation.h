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
@property (nonatomic, retain) NSURL* imageURL;
@property (nonatomic, copy) void (^finishBlock)(id image, NSError* error);
@property (nonatomic, assign) NSTimeInterval timeout;

// -- Initializers --
- (instancetype)initWithImageURL:(NSURL*)imageURL
                     finishBlock:(void (^)(id image, NSError* error))finishBlock;

@end
