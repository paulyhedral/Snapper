//
//  SNFilterClause.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>


typedef enum : NSInteger {
    SNFilterClauseObjectTypePost,
    SNFilterClauseObjectTypeStar,
    SNFilterClauseObjectTypeUserFollow,
    SNFilterClauseObjectTypeStreamMarker,
    SNFilterClauseObjectTypeMessage,
    SNFilterClauseObjectTypeChannel,
    SNFilterClauseObjectTypeChannelSubscription,
} SNFilterClauseObjectType;

typedef enum : NSInteger {
    SNFilterClauseOperatorEquals,
    SNFilterClauseOperatorMatches,
    SNFilterClauseOperatorLessThan,
    SNFilterClauseOperatorLessThanOrEqual,
    SNFilterClauseOperatorGreaterThan,
    SNFilterClauseOperatorGreaterThanOrEqual,
    SNFilterClauseOperatorOneOf,
} SNFilterClauseOperator;

@interface SNFilterClause : MTLModel

@property (nonatomic, copy) NSString* field;
@property (nonatomic, assign) SNFilterClauseObjectType objectType;
@property (nonatomic, assign) SNFilterClauseOperator op;
@property (nonatomic, retain) id value;

@end
