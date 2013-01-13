//
//  SNPListInteractionsOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPListInteractionsOperation.h"

#import "SNPInteraction.h"
#import "SNPUser.h"
#import "SNPPost.h"

#import "SNPAPIUtils.h"
#import "SNPConstants.h"


@implementation SNPListInteractionsOperation

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] getInteractionsEndpointURL];
    self.serializationBlock = ^id(NSArray* responseData, NSError** error) {

        NSMutableArray* interactions = [NSMutableArray new];

        for(NSDictionary* interactionDict in responseData) {
            SNPInteraction* interaction = [SNPInteraction modelWithDictionary:interactionDict];

            NSMutableArray* objects = [NSMutableArray new];
            for(NSDictionary* objectDict in interactionDict[@"objects"]) {
                SNPPost* post = nil;
                SNPUser* user = nil;

                switch(interaction.action) {
                    case SNPInteractionActionFollow:
                        user = [SNPUser modelWithExternalRepresentation:objectDict];
                        if(user == nil) {
                            *error = [NSError errorWithDomain:SNP_ERROR_DOMAIN
                                                         code:SNPSerializationErrorCode
                                                     userInfo:nil];
                            return nil;
                        }
                        [objects addObject:user];
                        break;

                    case SNPInteractionActionReply:
                        post = [SNPPost modelWithExternalRepresentation:objectDict];
                        if(post == nil) {
                            *error = [NSError errorWithDomain:SNP_ERROR_DOMAIN
                                                         code:SNPSerializationErrorCode
                                                     userInfo:nil];
                            return nil;
                        }
                        [objects addObject:post];
                        break;

                    case SNPInteractionActionRepost:
                        post = [SNPPost modelWithExternalRepresentation:objectDict];
                        if(post == nil) {
                            *error = [NSError errorWithDomain:SNP_ERROR_DOMAIN
                                                         code:SNPSerializationErrorCode
                                                     userInfo:nil];
                            return nil;
                        }
                        [objects addObject:post];
                        break;

                    case SNPInteractionActionStar:
                        post = [SNPPost modelWithExternalRepresentation:objectDict];
                        if(post == nil) {
                            *error = [NSError errorWithDomain:SNP_ERROR_DOMAIN
                                                         code:SNPSerializationErrorCode
                                                     userInfo:nil];
                            return nil;
                        }
                        [objects addObject:post];
                        break;

                    default:
                        *error = [NSError errorWithDomain:SNP_ERROR_DOMAIN
                                                     code:SNPSerializationErrorCode
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
                SNPUser* user = [SNPUser modelWithExternalRepresentation:userDict];
                [users addObject:user];
            }
            interaction.users = [users copy];
        }
        
        return interactions;
    };
    
    [super main];
}

@end
