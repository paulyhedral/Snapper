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
#import "SNPChannel.h"

#import "SNPAPIUtils.h"
#import "SNPConstants.h"


@implementation SNPListInteractionsOperation

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] getInteractionsEndpointURL];
    self.serializationBlock = ^id(NSArray* responseData, NSError** error) {

        NSMutableArray* interactions = [NSMutableArray new];

        for(NSDictionary* interactionDict in responseData) {
            MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:interactionDict
                                                                          modelClass:[SNPInteraction class]
                                                                               error:error];
            SNPInteraction* interaction = (SNPInteraction*)[adapter model];

            NSMutableArray* objects = [NSMutableArray new];
            for(NSDictionary* objectDict in interactionDict[@"objects"]) {
                MTLJSONAdapter* adapter = nil;
                SNPPost* post = nil;
                SNPUser* user = nil;
                SNPChannel* channel = nil;

                switch(interaction.action) {
                    case SNPInteractionActionFollow:
                        adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:objectDict
                                                                      modelClass:[SNPUser class]
                                                                           error:error];
                        if(adapter) {
                            user = (SNPUser*)[adapter model];
                            if(user == nil) {
                                *error = [NSError errorWithDomain:SNP_ERROR_DOMAIN
                                                             code:SNPSerializationErrorCode
                                                         userInfo:(@{
                                                                     @"property" : @"follow.objects[user]",
                                                                     @"value" : objectDict,
                                                                     })];
                                return nil;
                            }
                            [objects addObject:user];
                        }
                        break;

                    case SNPInteractionActionReply:
                        adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:objectDict
                                                                      modelClass:[SNPPost class]
                                                                           error:error];
                        if(adapter) {
                            post = (SNPPost*)[adapter model];
                            if(post == nil) {
                                *error = [NSError errorWithDomain:SNP_ERROR_DOMAIN
                                                             code:SNPSerializationErrorCode
                                                         userInfo:(@{
                                                                     @"property" : @"reply.objects[post]",
                                                                     @"value" : objectDict,
                                                                     })];
                                return nil;
                            }
                            [objects addObject:post];
                        }
                        break;

                    case SNPInteractionActionRepost:
                        adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:objectDict
                                                                      modelClass:[SNPPost class]
                                                                           error:error];
                        if(adapter) {
                            post = (SNPPost*)[adapter model];
                            if(post == nil) {
                                *error = [NSError errorWithDomain:SNP_ERROR_DOMAIN
                                                             code:SNPSerializationErrorCode
                                                         userInfo:(@{
                                                                     @"property" : @"repost.objects[post]",
                                                                     @"value" : objectDict,
                                                                     })];
                                return nil;
                            }
                            [objects addObject:post];
                        }
                        break;

                    case SNPInteractionActionStar:
                        adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:objectDict
                                                                      modelClass:[SNPPost class]
                                                                           error:error];
                        if(adapter) {
                            post = (SNPPost*)[adapter model];
                            if(post == nil) {
                                *error = [NSError errorWithDomain:SNP_ERROR_DOMAIN
                                                             code:SNPSerializationErrorCode
                                                         userInfo:(@{
                                                                     @"property" : @"star.objects[post]",
                                                                     @"value" : objectDict,
                                                                     })];
                                return nil;
                            }
                            [objects addObject:post];
                        }
                        break;

                    case SNPInteractionActionBroadcastCreate:
                    case SNPInteractionActionBroadcastSubscribe:
                    case SNPInteractionActionBroadcastUnsubscribe:
                        adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:objectDict
                                                                      modelClass:[SNPChannel class]
                                                                           error:error];
                        if(adapter) {
                            channel = (SNPChannel*)[adapter model];
                            if(channel == nil) {
                                *error = [NSError errorWithDomain:SNP_ERROR_DOMAIN
                                                             code:SNPSerializationErrorCode
                                                         userInfo:(@{
                                                                     @"property" : @"broadcast*.objects[channel]",
                                                                     @"value" : objectDict,
                                                                     })];
                                return nil;
                            }
                            [objects addObject:channel];
                        }
                        break;

                    case SNPInteractionActionWelcome:
                        // do nothing
                        break;

                    default:
                        *error = [NSError errorWithDomain:SNP_ERROR_DOMAIN
                                                     code:SNPSerializationErrorCode
                                                 userInfo:(@{
                                                             @"property" : @"action(unknown)",
                                                             @"value" : @(interaction.action)
                                                             })];
                        break;
                }
            }
            interaction.objects = [objects copy];

            NSMutableArray* users = [NSMutableArray new];
            for(NSDictionary* userDict in interactionDict[@"users"]) {
                NSError* error = nil;
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:userDict
                                                                              modelClass:[SNPUser class]
                                                                                   error:&error];
                if(adapter) {
                    SNPUser* user = (SNPUser*)[adapter model];
                    [users addObject:user];
                }
            }
            interaction.users = [users copy];
            
            [interactions addObject:interaction];
        }
        
        return interactions;
    };
    
    [super main];
}

@end
