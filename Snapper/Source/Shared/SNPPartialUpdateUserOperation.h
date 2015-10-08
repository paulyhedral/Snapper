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
@property (nonatomic, nullable, copy) NSString* fullname;
@property (nonatomic, nullable, copy) NSString* locale;
@property (nonatomic, nullable, copy) NSString* timezone;
@property (nonatomic, nullable, copy) NSString* descriptionText;
@property (nonatomic, nullable, retain) NSArray* descriptionEntities;
@property (nonatomic, nullable, retain) NSArray* annotations;

@end
