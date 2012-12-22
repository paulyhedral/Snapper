//
//  SNListInteractionsOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNListInteractionsOperation.h"

#import "SNInteraction.h"
#import "SNUser.h"
#import "SNPost.h"

#import "SNAPIUtils.h"
#import "SNConstants.h"


@implementation SNListInteractionsOperation

- (void)main {

    self.endpoint = [[SNAPIUtils sharedAPIUtils] getInteractionsEndpointURL];
    self.serializationBlock = ^id(NSArray* responseData, NSError** error) {

        NSMutableArray* interactions = [NSMutableArray new];

        for(NSDictionary* interactionDict in responseData) {
            SNInteraction* interaction = [SNInteraction modelWithDictionary:interactionDict];

            NSMutableArray* objects = [NSMutableArray new];
            for(NSDictionary* objectDict in interactionDict[@"objects"]) {
                SNPost* post = nil;
                SNUser* user = nil;

                switch(interaction.action) {
                    case SNInteractionActionFollow:
                        user = [SNUser modelWithExternalRepresentation:objectDict];
                        if(user == nil) {
                            *error = [NSError errorWithDomain:SN_ERROR_DOMAIN
                                                         code:SNSerializationErrorCode
                                                     userInfo:nil];
                            return nil;
                        }
                        [objects addObject:user];
                        break;

                    case SNInteractionActionReply:
                        post = [SNPost modelWithExternalRepresentation:objectDict];
                        if(post == nil) {
                            *error = [NSError errorWithDomain:SN_ERROR_DOMAIN
                                                         code:SNSerializationErrorCode
                                                     userInfo:nil];
                            return nil;
                        }
                        [objects addObject:post];
                        break;

                    case SNInteractionActionRepost:
                        post = [SNPost modelWithExternalRepresentation:objectDict];
                        if(post == nil) {
                            *error = [NSError errorWithDomain:SN_ERROR_DOMAIN
                                                         code:SNSerializationErrorCode
                                                     userInfo:nil];
                            return nil;
                        }
                        [objects addObject:post];
                        break;

                    case SNInteractionActionStar:
                        post = [SNPost modelWithExternalRepresentation:objectDict];
                        if(post == nil) {
                            *error = [NSError errorWithDomain:SN_ERROR_DOMAIN
                                                         code:SNSerializationErrorCode
                                                     userInfo:nil];
                            return nil;
                        }
                        [objects addObject:post];
                        break;

                    default:
                        *error = [NSError errorWithDomain:SN_ERROR_DOMAIN
                                                     code:SNSerializationErrorCode
                                                 userInfo:(@{
                                                           @"property" : @"action",
                                                           @"value" : @(interaction.action)
                                                           })];
                        break;
                }
            }
            interaction.objects = [objects copy];

            NSMutableArray* users = [NSMutableArray new];
            for(NSDictionary* userDict in interactionDict[@"users"]) {
                SNUser* user = [SNUser modelWithExternalRepresentation:userDict];
                [users addObject:user];
            }
            interaction.users = [users copy];
        }
        
        return interactions;
    };
    
    [super main];
}

@end
