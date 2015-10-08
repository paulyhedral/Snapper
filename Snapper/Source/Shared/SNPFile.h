//
//  SNPFile.h
//  Snapper
//
//  Created by Paul Schifferer on 1/28/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>

#import "SNPSource.h"
#import "SNPUser.h"


typedef enum : NSInteger {
    SNPFileKindImage,
    SNPFileKindOther,
} SNPFileKind;

@interface SNPDerivedFile : MTLModel
<MTLJSONSerializing>

@property (nonatomic, nonnull, copy) NSString* mimeType;
@property (nonatomic, nonnull, copy) NSString* sha1;
@property (nonatomic, assign) NSUInteger size;
@property (nonatomic, nonnull, copy) NSURL* URL;
@property (nonatomic, nonnull, copy) NSDate* URLExpires;
@property (nonatomic, assign) NSUInteger imageWidth;
@property (nonatomic, assign) NSUInteger imageHeight;

@end

@interface SNPFile : MTLModel
<MTLJSONSerializing>

@property (nonatomic, nullable, copy) NSArray* annotations;
@property (nonatomic, assign, getter=isComplete) BOOL complete;
@property (nonatomic, nullable, copy) NSDictionary* derivedFiles;
@property (nonatomic, nonnull, copy) NSString* fileToken;
@property (nonatomic, assign) NSUInteger fileId;
@property (nonatomic, assign) SNPFileKind kind;
@property (nonatomic, nonnull, copy) NSString* mimeType;
@property (nonatomic, nonnull, copy) NSString* name;
@property (nonatomic, nonnull, copy) NSString* sha1;
@property (nonatomic, assign) NSUInteger size;
@property (nonatomic, nonnull, retain) SNPSource* source;
@property (nonatomic, assign) NSUInteger totalSize;
@property (nonatomic, nonnull, copy) NSString* type;
@property (nonatomic, nonnull, copy) NSURL* URL;
@property (nonatomic, nonnull, copy) NSDate* URLExpires;
@property (nonatomic, nonnull, retain) SNPUser* user;
@property (nonatomic, assign) NSUInteger imageWidth;
@property (nonatomic, assign) NSUInteger imageHeight;

@end
