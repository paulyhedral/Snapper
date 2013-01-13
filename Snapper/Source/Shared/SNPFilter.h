//
//  SNPFilter.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>


typedef enum : NSInteger {
    SNPFilterMatchPolicyIncludeAny,
    SNPFilterMatchPolicyIncludeAll,
    SNPFilterMatchPolicyExcludeAny,
    SNPFilterMatchPolicyExcludeAll
} SNPFilterMatchPolicy;

@interface SNPFilter : MTLModel

@property (nonatomic, assign) NSInteger filterId;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, assign) SNPFilterMatchPolicy matchPolicy;
@property (nonatomic, retain) NSArray* clauses;

@end
