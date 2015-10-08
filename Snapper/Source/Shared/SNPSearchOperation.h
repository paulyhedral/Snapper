//
//  SNPSearchOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 8/13/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"


// -- Index values --
#define SNP_SEARCH_INDEX_COMPLETE (@"complete")

// -- Order values --
#define SNP_SEARCH_ORDER_ID (@"id")
#define SNP_SEARCH_ORDER_SCORE (@"score")

@interface SNPSearchOperation : SNPBaseUserTokenOperation

// -- Properties --
@property (nonatomic, nullable, retain) NSString* index;
@property (nonatomic, nullable, retain) NSString* order;
@property (nonatomic, nullable, retain) NSString* query;
@property (nonatomic, nullable, retain) NSString* text;
@property (nonatomic, nullable, retain) NSString* hashtags;
@property (nonatomic, nullable, retain) NSString* links;
@property (nonatomic, nullable, retain) NSString* linkDomains;
@property (nonatomic, nullable, retain) NSString* mentions;
@property (nonatomic, nullable, retain) NSString* leadingMentions;
@property (nonatomic, nullable, retain) NSString* annotationTypes;
@property (nonatomic, nullable, retain) NSString* attachmentTypes;
@property (nonatomic, nullable, retain) NSString* crosspostURL;
@property (nonatomic, nullable, retain) NSString* crosspostDomain;
@property (nonatomic, nullable, retain) NSString* placeId;
@property (nonatomic, assign) BOOL reply;
@property (nonatomic, assign) BOOL directed;
@property (nonatomic, assign) BOOL hasLocation;
@property (nonatomic, assign) BOOL hasCheckin;
@property (nonatomic, assign) BOOL crosspost;
@property (nonatomic, assign) BOOL hasAttachment;
@property (nonatomic, assign) BOOL hasOembedVideo;
@property (nonatomic, assign) BOOL hasOembedHtml5Video;
@property (nonatomic, assign) BOOL hasOembedRich;
@property (nonatomic, nullable, retain) NSString* language;
@property (nonatomic, nullable, retain) NSString* clientId;
@property (nonatomic, assign) NSInteger creatorId;
@property (nonatomic, assign) NSInteger replyTo;
@property (nonatomic, assign) NSInteger threadId;

// -- Initializers --
- (nonnull instancetype)initWithQuery:(nonnull NSString*)query
                            accountId:(nonnull NSString*)accountId
                          finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;
- (nonnull instancetype)initWithText:(nonnull NSString*)text
                           accountId:(nonnull NSString*)accountId
                         finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
