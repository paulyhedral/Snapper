//
//  SNPSearchPlacesOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 2/5/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserOperation.h"


@interface SNPSearchPlacesOperation : SNPBaseUserOperation

// -- Properties --
@property (nonatomic, assign) CGFloat latitude;
@property (nonatomic, assign) CGFloat longitude;
@property (nonatomic, copy) NSString* q;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) CGFloat altitude;
@property (nonatomic, assign) CGFloat horizontalAccuracy;
@property (nonatomic, assign) CGFloat verticalAccuracy;

// -- Initializers --
- (id)initWithLatitude:(CGFloat)latitude
             longitude:(CGFloat)longitude
             accountId:(NSString*)accountId
           finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
