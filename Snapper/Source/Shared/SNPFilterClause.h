//
//  SNPFilterClause.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>


typedef NS_ENUM(NSInteger, SNPFilterClauseObjectType) {
    SNPFilterClauseObjectTypePost,
    SNPFilterClauseObjectTypeStar,
    SNPFilterClauseObjectTypeUserFollow,
    SNPFilterClauseObjectTypeStreamMarker,
    SNPFilterClauseObjectTypeMessage,
    SNPFilterClauseObjectTypeChannel,
    SNPFilterClauseObjectTypeChannelSubscription,
};

typedef NS_ENUM(NSInteger, SNPFilterClauseOperator) {
    SNPFilterClauseOperatorEquals,
    SNPFilterClauseOperatorMatches,
    SNPFilterClauseOperatorLessThan,
    SNPFilterClauseOperatorLessThanOrEqual,
    SNPFilterClauseOperatorGreaterThan,
    SNPFilterClauseOperatorGreaterThanOrEqual,
    SNPFilterClauseOperatorOneOf,
};

@interface SNPFilterClause : MTLModel
<MTLJSONSerializing>

@property (nonatomic, nonnull, copy) NSString* field;
@property (nonatomic, assign) SNPFilterClauseObjectType objectType;
@property (nonatomic, assign) SNPFilterClauseOperator op;
@property (nonatomic, nonnull, retain) id value;

@end
