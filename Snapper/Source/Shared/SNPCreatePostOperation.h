//
//  SNPCreatePostOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2014 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"
#import "SNPPostParameters.h"


@interface SNPCreatePostOperation : SNPBaseUserTokenOperation
<SNPPostParameters>

// -- Properties --
/**
 * The body text of the post. Optional.
 *
 * Note that this property and #machineOnly are "mutually-exclusive", with the presence of a
 * non-nil, non-zero length #text property value superceding the #machineOnly property.
 */
@property (nonatomic, nullable, copy) NSString* text;
/**
 * The post ID to which this post is a reply.
 */
@property (nonatomic, assign) NSUInteger replyTo;
/**
 * A flag indicating whether this post is meant for human or machine consumption.
 *
 * Note that this property and #text are "mutually-exclusive", with the presence of a
 * non-nil, non-zero length #text property value superceding the this property.
 */
@property (nonatomic, assign) BOOL machineOnly;
/**
 * An array of SNPAnnotation objects to include in the post.
 */
@property (nonatomic, nullable, retain) NSArray* annotations;
/**
 * An array of SNPEntity-subclassed objects, e.g., SNPMention, SNPHashtag, or SNPLink to include in the post.
 */
@property (nonatomic, nullable, retain) NSArray* entities;
/**
 * Indicates whether links should be parsed from the post text by the server in addition to any
 * custom link entities that are provided.
 */
@property (nonatomic, assign) BOOL parseLinks;
/**
 * Indicates whether links should be parsed using Markdown syntax from the post text by the server
 * in addition to any custom link entities that are provided.
 */
@property (nonatomic, assign) BOOL parseMarkdown;

// -- Initialization --
/**
 * Instantiates an NSOperation that will submit a new post to the ADN API.
 *
 * See documentation on each property for details and restrictions.
 */
- (nonnull instancetype)initWithText:(nullable NSString*)text
                             replyTo:(NSUInteger)replyTo
                         machineOnly:(BOOL)machineOnly
                         annotations:(nullable NSArray*)annotations
                            entities:(nullable NSArray*)entities
                           accountId:(nonnull NSString*)accountId
                       progressBlock:(nullable void (^)(NSUInteger bytesWritten, NSUInteger totalBytesWritten, NSUInteger totalBytes))progressBlock
                         finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

/**
 * Instantiates an NSOperation that will submit a new post to the ADN API.
 *
 * See documentation on each property for details and restrictions.
 */
- (nonnull instancetype)initWithText:(nullable NSString*)text
                             replyTo:(NSUInteger)replyTo
                         machineOnly:(BOOL)machineOnly
                         annotations:(nullable NSArray*)annotations
                            entities:(nullable NSArray*)entities
                          parseLinks:(BOOL)parseLinks
                       parseMarkdown:(BOOL)parseMarkdown
                           accountId:(nonnull NSString*)accountId
                       progressBlock:(nullable void (^)(NSUInteger bytesWritten, NSUInteger totalBytesWritten, NSUInteger totalBytes))progressBlock
                         finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
