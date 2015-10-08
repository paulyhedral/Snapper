//
//  SNPFilter.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>


typedef NS_ENUM(NSInteger, SNPFilterMatchPolicy) {
    SNPFilterMatchPolicyIncludeAny,
    SNPFilterMatchPolicyIncludeAll,
    SNPFilterMatchPolicyExcludeAny,
    SNPFilterMatchPolicyExcludeAll
};

@interface SNPFilter : MTLModel
<MTLJSONSerializing>

@property (nonatomic, assign) NSUInteger filterId;
@property (nonatomic, nonnull, copy) NSString* name;
@property (nonatomic, assign) SNPFilterMatchPolicy matchPolicy;
@property (nonatomic, nonnull, copy) NSArray* clauses;

@end
