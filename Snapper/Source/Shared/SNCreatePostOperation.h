//
//  SNCreatePostOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNBaseOAuthOperation.h"


@interface SNCreatePostOperation : SNBaseOAuthOperation

- (id)initWithText:(NSString*)text
           replyTo:(NSInteger)replyTo
       machineOnly:(BOOL)machineOnly
       annotations:(NSArray*)annotations
          entities:(NSArray*)entities
         accountId:(NSString*)accountId
       finishBlock:(void (^)(SNResponse* response))finishBlock;

@end
