//
//  SNPAPIUtils.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWLSynthesizeSingleton.h"


@interface SNPAPIUtils : NSObject

// -- Singleton --
CWL_DECLARE_SINGLETON_FOR_CLASS_WITH_ACCESSOR(SNPAPIUtils, sharedInstance)

// -- Properties --
@property (nonatomic, copy) NSURL* rootAPIURL;

// -- User URL methods --
- (NSURL*)getUserEndpointURL:(NSUInteger)userId;
- (NSURL*)updateUserEndpointURL;
- (NSURL*)getUserAvatarEndpointURL:(NSUInteger)userId;
- (NSURL*)updateUserAvatarEndpointURL;
- (NSURL*)getUserCoverImageEndpointURL:(NSUInteger)userId;
- (NSURL*)updateUserCoverImageEndpointURL;
- (NSURL*)followUserEndpointURL:(NSUInteger)userId;
- (NSURL*)unfollowUserEndpointURL:(NSUInteger)userId;
- (NSURL*)muteUserEndpointURL:(NSUInteger)userId;
- (NSURL*)unmuteUserEndpointURL:(NSUInteger)userId;
- (NSURL*)getUsersEndpointURL;
- (NSURL*)searchUsersEndpointURL;
- (NSURL*)getUserFolloweesEndpointURL:(NSUInteger)userId;
- (NSURL*)getUserFollowersEndpointURL:(NSUInteger)userId;
- (NSURL*)getUserFolloweeIdsEndpointURL:(NSUInteger)userId;
- (NSURL*)getUserFollowerIdsEndpointURL:(NSUInteger)userId;
- (NSURL*)getMutedUsersEndpointURL:(NSUInteger)userId;
- (NSURL*)getBlockedUsersEndpointURL:(NSUInteger)userId;
- (NSURL*)getRepostersEndpointURL:(NSUInteger)postId;
- (NSURL*)getStarrersEndpointURL:(NSUInteger)postId;
- (NSURL*)blockUserEndpointURL:(NSUInteger)userId;
- (NSURL*)unblockUserEndpointURL:(NSUInteger)userId;

// -- Post URL methods --
- (NSURL*)createPostEndpointURL;
- (NSURL*)getPostEndpointURL:(NSUInteger)postId;
- (NSURL*)deletePostEndpointURL:(NSUInteger)postId;
- (NSURL*)repostEndpointURL:(NSUInteger)postId;
- (NSURL*)unrepostEndpointURL:(NSUInteger)postId;
- (NSURL*)starPostEndpointURL:(NSUInteger)postId;
- (NSURL*)unstarPostEndpointURL:(NSUInteger)postId;
- (NSURL*)getPostsEndpointURL;
- (NSURL*)getUserPostsEndpointURL:(NSUInteger)userId;
- (NSURL*)getStarredPostsEndpointURL:(NSUInteger)userId;
- (NSURL*)getMentionsEndpointURL:(NSUInteger)userId;
- (NSURL*)getTaggedPostsEndpointURL:(NSString*)hashtag;
- (NSURL*)getRepliesEndpointURL:(NSUInteger)postId;
- (NSURL*)getPersonalStreamEndpointURL;
- (NSURL*)getUnifiedPersonalStreamEndpointURL;
- (NSURL*)getGlobalStreamEndpointURL;
- (NSURL*)reportPostEndpointURL:(NSUInteger)postId;
- (NSURL*)searchEndpointURL;

// -- Channel URL methods --
- (NSURL*)getSubscribedChannelsEndpointURL;
- (NSURL*)createChannelEndpointURL;
- (NSURL*)getChannelEndpointURL:(NSUInteger)channelId;
- (NSURL*)getChannelsEndpointURL;
- (NSURL*)getMyChannelsEndpointURL;
- (NSURL*)updateChannelEndpointURL:(NSUInteger)channelId;
- (NSURL*)subscribeToChannelEndpointURL:(NSUInteger)channelId;
- (NSURL*)unsubscribeFromChannelEndpointURL:(NSUInteger)channelId;
- (NSURL*)getChannelSubscribersEndpointURL:(NSUInteger)channelId;
- (NSURL*)getChannelSubscriberIdsEndpointURL:(NSUInteger)channelId;
- (NSURL*)getSubscribersEndpointURL;
- (NSURL*)getMutedChannelsEndpointURL;
- (NSURL*)muteChannelEndpointURL:(NSUInteger)channelId;
- (NSURL*)unmuteChannelEndpointURL:(NSUInteger)channelId;

// -- Message URL methods --
- (NSURL*)getChannelMessagesEndpointURL:(NSUInteger)channelId;
- (NSURL*)createMessageEndpointURL:(NSUInteger)channelId;
- (NSURL*)createPMMessageEndpointURL;
- (NSURL*)getMessageEndpointURL:(NSUInteger)channelId
                      messageId:(NSUInteger)messageId;
- (NSURL*)getMessagesEndpointURL;
- (NSURL*)deleteMessageEndpointURL:(NSUInteger)channelId
                         messageId:(NSUInteger)messageId;
- (NSURL*)getMyMessagesEndpointURL;

// -- Stream URL methods --
- (NSURL*)createStreamEndpointURL;
- (NSURL*)getStreamEndpointURL:(NSUInteger)streamId;
- (NSURL*)deleteStreamEndpointURL:(NSUInteger)streamId;
- (NSURL*)getAllStreamsEndpointURL;
- (NSURL*)deleteAllStreamsEndpointURL;

// -- Filter URL methods --
- (NSURL*)createFilterEndpointURL;
- (NSURL*)getFilterEndpointURL:(NSUInteger)filterId;
- (NSURL*)updateFilterEndpointURL:(NSUInteger)filterId;
- (NSURL*)deleteFilterEndpointURL:(NSUInteger)filterId;
- (NSURL*)getFiltersEndpointURL;
- (NSURL*)deleteFiltersEndpointURL;

// -- Interaction URL methods --
- (NSURL*)getInteractionsEndpointURL;

// -- Stream Marker URL methods --
- (NSURL*)updateStreamMarkerEndpointURL;

// -- Token URL methods --
- (NSURL*)tokenEndpointURL;

// -- File URL methods --
- (NSURL*)createFileEndpointURL;
- (NSURL*)getFileEndpointURL:(NSUInteger)fileId;
- (NSURL*)getFilesEndpointURL;
- (NSURL*)deleteFileEndpointURL:(NSUInteger)fileId;
- (NSURL*)getMyFilesEndpointURL;
- (NSURL*)updateFileEndpointURL:(NSUInteger)fileId;
- (NSURL*)updateFileContentEndpointURL:(NSUInteger)fileId;

// -- Place URL methods --
- (NSURL*)getPlaceEndpointURL:(NSString*)factualId;
- (NSURL*)searchPlaceEndpointURL;

// -- Text processing --
- (NSURL*)processTextEndpointURL;

// -- Explore stream URL methods --
- (NSURL*)getAllExploreStreamsEndpointURL;
- (NSURL*)getExploreStreamEndpointURL:(NSString*)slug;

// -- Configuration methods --
- (NSURL*)configurationEndpointURL;

@end
