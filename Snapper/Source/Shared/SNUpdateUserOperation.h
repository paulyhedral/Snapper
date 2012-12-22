//
//  SNUpdateUserOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNBaseOAuthOperation.h"


@interface SNUpdateUserOperation : SNBaseOAuthOperation

// -- Properties --
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* locale;
@property (nonatomic, copy) NSString* timezone;
@property (nonatomic, copy) NSString* description;
@property (nonatomic, retain) NSArray* descriptionEntities;
@property (nonatomic, retain) NSArray* annotations;

// -- Initializers --
- (id)initWithName:(NSString*)name
            locale:(NSString*)locale
          timezone:(NSString*)timezone
       description:(NSString*)description
         accountId:(NSString*)accountId
       finishBlock:(void (^)(SNResponse* response))finishBlock;

@end
