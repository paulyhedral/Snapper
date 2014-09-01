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
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* locale;
@property (nonatomic, copy) NSString* timezone;
@property (nonatomic, copy) NSString* descriptionText;
@property (nonatomic, retain) NSArray* descriptionEntities;
@property (nonatomic, retain) NSArray* annotations;

// -- Initializers --
- (instancetype)initWithName:(NSString*)name
            locale:(NSString*)locale
          timezone:(NSString*)timezone
       description:(NSString*)descriptionText
         accountId:(NSString*)accountId
       finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
