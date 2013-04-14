//
//  SNPCreateMessageOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"


@interface SNPCreateMessageOperation : SNPBaseUserTokenOperation

// -- Properties --
/**
 * The channel ID for the channel in which to message will be created.
 *
 * Note that this property and #machineOnly are "mutually-exclusive", with the presence of a
 * non-nil, non-zero length #text property value superceding the #machineOnly property.
 */
@property (nonatomic, assign) NSUInteger channelId;
/**
 * The body text of the message. Optional.
 *
 * Note that this property and #machineOnly are "mutually-exclusive", with the presence of a
 * non-nil, non-zero length #text property value superceding the #machineOnly property.
 */
@property (nonatomic, copy) NSString* text;
/**
 * The message ID to which this message is a reply.
 */
@property (nonatomic, assign) NSUInteger replyTo;
/**
 * A flag indicating whether this message is meant for human or machine consumption.
 *
 * Note that this property and #text are "mutually-exclusive", with the presence of a
 * non-nil, non-zero length #text property value superceding the this property.
 */
@property (nonatomic, assign) BOOL machineOnly;
/**
 * An array of SNPAnnotation objects to include in the message.
 */
@property (nonatomic, retain) NSArray* annotations;
/**
 * An array of SNPEntity-subclassed objects, e.g., SNPMention, SNPHashtag, or SNPLink to include in the message.
 */
@property (nonatomic, retain) NSArray* entities;

// -- Initializers --
- (id)initWithChannelId:(NSUInteger)channelId
                   text:(NSString*)text
                replyTo:(NSUInteger)replyTo
            machineOnly:(BOOL)machineOnly
            annotations:(NSArray*)annotations
               entities:(NSArray*)entities
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
