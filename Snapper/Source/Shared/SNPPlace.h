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

@property (nonatomic, copy) NSString* factualId;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, assign) CGFloat longitude;
@property (nonatomic, assign) CGFloat latitude;
@property (nonatomic, copy) NSString* address;
@property (nonatomic, copy) NSString* addressExtended;
@property (nonatomic, copy) NSString* locality;
@property (nonatomic, copy) NSString* region;
@property (nonatomic, copy) NSString* adminRegion;
@property (nonatomic, copy) NSString* postTown;
@property (nonatomic, copy) NSString* POBox;
@property (nonatomic, copy) NSString* postcode;
@property (nonatomic, copy) NSString* countryCode;
@property (nonatomic, assign, getter=isOpen) BOOL open;
@property (nonatomic, copy) NSURL* website;
@property (nonatomic, copy) NSString* telephone;
@property (nonatomic, copy) NSString* fax;
@property (nonatomic, copy) NSArray* categories;

@end
