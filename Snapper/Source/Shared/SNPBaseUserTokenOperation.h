//
//  SNPBaseUserTokenOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPBaseClientOperation.h"


@interface SNPBaseUserTokenOperation : SNPBaseClientOperation

// -- Properties --
@property (nonatomic, nonnull, copy) NSString* accountId;

// -- Pagination query parameters --
@property (nonatomic, assign) NSInteger beforeId;
@property (nonatomic, assign) NSInteger sinceId;
@property (nonatomic, assign) NSInteger count;

// -- General/post stream query parameters --
@property (nonatomic, assign) BOOL includeMuted;
@property (nonatomic, assign) BOOL includeDeleted;
@property (nonatomic, assign) BOOL includeDirectedPosts;
@property (nonatomic, assign) BOOL includeMachine;
@property (nonatomic, assign) BOOL includeStarredBy;
@property (nonatomic, assign) BOOL includeReposters;
@property (nonatomic, assign) BOOL includePostAnnotations;
@property (nonatomic, assign) BOOL includeUser;

// -- Channel/message query parameters --
@property (nonatomic, nullable, retain) NSArray* channelTypes;
@property (nonatomic, assign) BOOL includeMessageAnnotations;
@property (nonatomic, assign) BOOL includeMarker;
@property (nonatomic, assign) BOOL includeRead;
@property (nonatomic, assign) BOOL includeRecentMessage;

// -- File query parameters --
@property (nonatomic, nullable, copy) NSArray* fileTypes;
@property (nonatomic, assign) BOOL includeIncomplete;
@property (nonatomic, assign) BOOL includePrivate;
@property (nonatomic, assign) BOOL includeFileAnnotations;

// -- Stream facet parameters --
@property (nonatomic, assign) BOOL hasOembedPhoto;

// -- Common query parameters --
@property (nonatomic, assign) BOOL includeAnnotations;
@property (nonatomic, assign) BOOL includeUserAnnotations;
@property (nonatomic, assign) BOOL includeHTML;

// -- User stream parameters --
@property (nonatomic, nullable, copy) NSString* connectionId;

// -- Initializers --
- (nonnull instancetype)initWithAccountId:(nonnull NSString*)accountId
                              finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;
- (nonnull instancetype)initWithEndpoint:(nonnull NSURL*)endpoint
                                  method:(nonnull NSString*)method
                                 headers:(nullable NSDictionary*)headers
                              parameters:(nullable NSDictionary*)parameters
                                    body:(nullable NSData*)body
                                bodyType:(nullable NSString*)bodyType
                               accountId:(nonnull NSString*)accountId
                           progressBlock:(nullable void (^)(NSUInteger bytesWritten, NSUInteger totalBytesWritten, NSUInteger totalBytes))progressBlock
                             finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
