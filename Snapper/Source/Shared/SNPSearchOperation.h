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
@property (nonatomic, retain) NSString* index;
@property (nonatomic, retain) NSString* order;
@property (nonatomic, retain) NSString* query;
@property (nonatomic, retain) NSString* text;
@property (nonatomic, retain) NSString* hashtags;
@property (nonatomic, retain) NSString* links;
@property (nonatomic, retain) NSString* linkDomains;
@property (nonatomic, retain) NSString* mentions;
@property (nonatomic, retain) NSString* leadingMentions;
@property (nonatomic, retain) NSString* annotationTypes;
@property (nonatomic, retain) NSString* attachmentTypes;
@property (nonatomic, retain) NSString* crosspostURL;
@property (nonatomic, retain) NSString* crosspostDomain;
@property (nonatomic, retain) NSString* placeId;
@property (nonatomic, assign) BOOL reply;
@property (nonatomic, assign) BOOL directed;
@property (nonatomic, assign) BOOL hasLocation;
@property (nonatomic, assign) BOOL hasCheckin;
@property (nonatomic, assign) BOOL crosspost;
@property (nonatomic, assign) BOOL hasAttachment;
@property (nonatomic, assign) BOOL hasOembedPhoto;
@property (nonatomic, assign) BOOL hasOembedVideo;
@property (nonatomic, assign) BOOL hasOembedHtml5Video;
@property (nonatomic, assign) BOOL hasOembedRich;
@property (nonatomic, retain) NSString* language;
@property (nonatomic, retain) NSString* clientId;
@property (nonatomic, assign) NSInteger creatorId;
@property (nonatomic, assign) NSInteger replyTo;
@property (nonatomic, assign) NSInteger threadId;

// -- Initializers --
- (instancetype)initWithQuery:(NSString*)query
                    accountId:(NSString*)accountId
                  finishBlock:(void (^)(SNPResponse* response))finishBlock;
- (instancetype)initWithText:(NSString*)text
                   accountId:(NSString*)accountId
                 finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
