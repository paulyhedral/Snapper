//
//  SNFilter.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>


typedef enum : NSInteger {
    SNFilterMatchPolicyIncludeAny,
    SNFilterMatchPolicyIncludeAll,
    SNFilterMatchPolicyExcludeAny,
    SNFilterMatchPolicyExcludeAll
} SNFilterMatchPolicy;

@interface SNFilter : MTLModel

@property (nonatomic, assign) NSInteger filterId;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, assign) SNFilterMatchPolicy matchPolicy;
@property (nonatomic, retain) NSArray* clauses;

@end
