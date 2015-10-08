//
//  SNPCreateMessageOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseMessageOperation.h"
#import "SNPMessageParameters.h"


@interface SNPCreateMessageOperation : SNPBaseMessageOperation
<SNPMessageParameters>

// -- Properties --
/**
 * The channel ID for the channel in which to message will be created.
 *
 * Note that this property and #machineOnly are "mutually-exclusive", with the presence of a
 * non-nil, non-zero length #text property value superceding the #machineOnly property.
 */
@property (nonatomic, assign) NSUInteger channelId;
/**
 */
@property (nonatomic, nonnull, copy) NSArray* destinations;
/**
 * The body text of the message. Optional.
 *
 * Note that this property and #machineOnly are "mutually-exclusive", with the presence of a
 * non-nil, non-zero length #text property value superceding the #machineOnly property.
 */
@property (nonatomic, nullable, copy) NSString* text;
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
@property (nonatomic, nullable, retain) NSArray* annotations;
/**
 * An array of SNPEntity-subclassed objects, e.g., SNPMention, SNPHashtag, or SNPLink to include in the message.
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

// -- Initializers --
- (nonnull instancetype)initWithChannelId:(NSUInteger)channelId
                                     text:(nullable NSString*)text
                                  replyTo:(NSUInteger)replyTo
                              machineOnly:(BOOL)machineOnly
                              annotations:(nullable NSArray*)annotations
                                 entities:(nullable NSArray*)entities
                                accountId:(nonnull NSString*)accountId
                              finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;
- (nonnull instancetype)initWithDestinations:(nonnull NSArray*)userIds
                                        text:(nullable NSString*)text
                                 annotations:(nullable NSArray*)annotations
                                    entities:(nullable NSArray*)entities
                                   accountId:(nonnull NSString*)accountId
                                 finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;
- (nonnull instancetype)initWithChannelId:(NSUInteger)channelId
                                     text:(nullable NSString*)text
                                  replyTo:(NSUInteger)replyTo
                              machineOnly:(BOOL)machineOnly
                              annotations:(nullable NSArray*)annotations
                                 entities:(nullable NSArray*)entities
                               parseLinks:(BOOL)parseLinks
                            parseMarkdown:(BOOL)parseMarkdown
                                accountId:(nonnull NSString*)accountId
                              finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;
- (nonnull instancetype)initWithDestinations:(nonnull NSArray*)userIds
                                        text:(nullable NSString*)text
                                 annotations:(nullable NSArray*)annotations
                                    entities:(nullable NSArray*)entities
                                  parseLinks:(BOOL)parseLinks
                               parseMarkdown:(BOOL)parseMarkdown
                                   accountId:(nonnull NSString*)accountId
                                 finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
