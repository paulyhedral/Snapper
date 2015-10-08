//
//  SNPSearchPlacesOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 2/5/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import "SNPBaseUserTokenOperation.h"


@interface SNPSearchPlacesOperation : SNPBaseUserTokenOperation

// -- Properties --
@property (nonatomic, assign) CGFloat latitude;
@property (nonatomic, assign) CGFloat longitude;
@property (nonatomic, nonnull, copy) NSString* q;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) CGFloat altitude;
@property (nonatomic, assign) CGFloat horizontalAccuracy;
@property (nonatomic, assign) CGFloat verticalAccuracy;

// -- Initializers --
- (nonnull instancetype)initWithLatitude:(CGFloat)latitude
                               longitude:(CGFloat)longitude
                               accountId:(nullable NSString*)accountId
                             finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
