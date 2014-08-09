//
//  SNPFilterClause.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>


typedef enum : NSInteger {
    SNPFilterClauseObjectTypePost,
    SNPFilterClauseObjectTypeStar,
    SNPFilterClauseObjectTypeUserFollow,
    SNPFilterClauseObjectTypeStreamMarker,
    SNPFilterClauseObjectTypeMessage,
    SNPFilterClauseObjectTypeChannel,
    SNPFilterClauseObjectTypeChannelSubscription,
} SNPFilterClauseObjectType;

typedef enum : NSInteger {
    SNPFilterClauseOperatorEquals,
    SNPFilterClauseOperatorMatches,
    SNPFilterClauseOperatorLessThan,
    SNPFilterClauseOperatorLessThanOrEqual,
    SNPFilterClauseOperatorGreaterThan,
    SNPFilterClauseOperatorGreaterThanOrEqual,
    SNPFilterClauseOperatorOneOf,
} SNPFilterClauseOperator;

@interface SNPFilterClause : MTLModel
<MTLJSONSerializing>

@property (nonatomic, copy) NSString* field;
@property (nonatomic, assign) SNPFilterClauseObjectType objectType;
@property (nonatomic, assign) SNPFilterClauseOperator op;
@property (nonatomic, retain) id value;

@end
