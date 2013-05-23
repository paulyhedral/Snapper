//
//  SNPPartialUpdateUserOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 5/22/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"
#import "SNPUserParameters.h"


@interface SNPPartialUpdateUserOperation : SNPBaseUserTokenOperation
<SNPUserParameters>

// -- Properties --
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* locale;
@property (nonatomic, copy) NSString* timezone;
@property (nonatomic, copy) NSString* descriptionText;
@property (nonatomic, retain) NSArray* descriptionEntities;
@property (nonatomic, retain) NSArray* annotations;

@end
