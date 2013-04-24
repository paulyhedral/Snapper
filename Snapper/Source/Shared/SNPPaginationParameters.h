//
//  SNPPaginationParameters.h
//  Snapper
//
//  Created by Paul Schifferer on 4/15/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol SNPPaginationParameters <NSObject>

@required
@property (nonatomic, assign) NSInteger beforeId;
@property (nonatomic, assign) NSInteger sinceId;
@property (nonatomic, assign) NSInteger count;

@end
