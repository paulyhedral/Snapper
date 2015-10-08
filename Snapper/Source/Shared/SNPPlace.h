//
//  SNPPlace.h
//  Snapper
//
//  Created by Paul Schifferer on 2/5/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import <Mantle/Mantle.h>


@interface SNPPlace : MTLModel
<MTLJSONSerializing>

@property (nonatomic, nonnull, copy) NSString* factualId;
@property (nonatomic, nonnull, copy) NSString* name;
@property (nonatomic, assign) CGFloat longitude;
@property (nonatomic, assign) CGFloat latitude;
@property (nonatomic, nullable, copy) NSString* address;
@property (nonatomic, nullable, copy) NSString* addressExtended;
@property (nonatomic, nullable, copy) NSString* locality;
@property (nonatomic, nullable, copy) NSString* region;
@property (nonatomic, nullable, copy) NSString* adminRegion;
@property (nonatomic, nullable, copy) NSString* postTown;
@property (nonatomic, nullable, copy) NSString* POBox;
@property (nonatomic, nullable, copy) NSString* postcode;
@property (nonatomic, nullable, copy) NSString* countryCode;
@property (nonatomic, assign, getter=isOpen) BOOL open;
@property (nonatomic, nullable, copy) NSURL* website;
@property (nonatomic, nullable, copy) NSString* telephone;
@property (nonatomic, nullable, copy) NSString* fax;
@property (nonatomic, nullable, copy) NSArray* categories;

@end
