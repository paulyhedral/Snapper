//
//  SNPUpdateUserOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"
#import "SNPUserParameters.h"


@interface SNPUpdateUserOperation : SNPBaseUserTokenOperation
<SNPUserParameters>

// -- Properties --
@property (nonatomic, nonnull, copy) NSString* fullName;
@property (nonatomic, nonnull, copy) NSString* locale;
@property (nonatomic, nonnull, copy) NSString* timezone;
@property (nonatomic, nonnull, copy) NSString* descriptionText;
@property (nonatomic, nullable, retain) NSArray* descriptionEntities;
@property (nonatomic, nullable, retain) NSArray* annotations;

// -- Initializers --
- (nonnull instancetype)initWithName:(nonnull NSString*)fullName
                              locale:(nonnull NSString*)locale
                            timezone:(nonnull NSString*)timezone
                         description:(nonnull NSString*)descriptionText
                           accountId:(nonnull NSString*)accountId
                         finishBlock:(nonnull void (^)(nonnull SNPResponse* response))finishBlock;

@end
