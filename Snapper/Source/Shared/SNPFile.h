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

@property (nonatomic, copy) NSString* mimeType;
@property (nonatomic, copy) NSString* sha1;
@property (nonatomic, assign) NSInteger size;
@property (nonatomic, copy) NSURL* URL;
@property (nonatomic, copy) NSDate* URLExpires;
@property (nonatomic, assign) NSInteger imageWidth;
@property (nonatomic, assign) NSInteger imageHeight;

@end

@interface SNPFile : MTLModel
<MTLJSONSerializing>

@property (nonatomic, retain) NSArray* annotations;
@property (nonatomic, assign) BOOL complete;
@property (nonatomic, retain) NSDictionary* derivedFiles;
@property (nonatomic, copy) NSString* fileToken;
@property (nonatomic, assign) NSInteger fileId;
@property (nonatomic, assign) SNPFileKind kind;
@property (nonatomic, copy) NSString* mimeType;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* sha1;
@property (nonatomic, assign) NSInteger size;
@property (nonatomic, retain) SNPSource* source;
@property (nonatomic, assign) NSInteger totalSize;
@property (nonatomic, copy) NSString* type;
@property (nonatomic, copy) NSURL* URL;
@property (nonatomic, copy) NSDate* URLExpires;
@property (nonatomic, retain) SNPUser* user;
@property (nonatomic, assign) NSInteger imageWidth;
@property (nonatomic, assign) NSInteger imageHeight;

@end
