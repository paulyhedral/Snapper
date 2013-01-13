//
//  SNPCreatePostOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserOperation.h"


@interface SNPCreatePostOperation : SNPBaseUserOperation

// -- Properties --
/**
 * The body text of the post. Optional.
 *
 * Note that this property and #machineOnly are "mutually-exclusive", with the presence of a
 * non-nil, non-zero length #text property value superceding the #machineOnly property.
 */
@property (nonatomic, copy) NSString* text;
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
@property (nonatomic, retain) NSArray* annotations;
/**
 * An array of SNPEntity-subclassed objects, e.g., SNPMention, SNPHashtag, or SNPLink to include in the post.
 */
@property (nonatomic, retain) NSArray* entities;

// -- Initialization --
/**
 * Instantiates an NSOperation that will submit a new post to the ADN API.
 *
 * See documentation on each property for details and restrictions.
 */
- (id)initWithText:(NSString*)text
           replyTo:(NSUInteger)replyTo
       machineOnly:(BOOL)machineOnly
       annotations:(NSArray*)annotations
          entities:(NSArray*)entities
         accountId:(NSString*)accountId
       finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
