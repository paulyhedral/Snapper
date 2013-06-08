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
CWL_DECLARE_SINGLETON_FOR_CLASS_WITH_ACCESSOR(SNPAPIUtils, sharedAPIUtils)

// -- Properties --
@property (nonatomic, copy) NSURL* rootAPIURL;

// -- User URL methods --
- (NSURL*)getUserEndpointURL:(NSInteger)userId;
- (NSURL*)updateUserEndpointURL;
- (NSURL*)getUserAvatarEndpointURL:(NSInteger)userId;
- (NSURL*)updateUserAvatarEndpointURL;
- (NSURL*)getUserCoverImageEndpointURL:(NSInteger)userId;
- (NSURL*)updateUserCoverImageEndpointURL;
- (NSURL*)followUserEndpointURL:(NSInteger)userId;
- (NSURL*)unfollowUserEndpointURL:(NSInteger)userId;
- (NSURL*)muteUserEndpointURL:(NSInteger)userId;
- (NSURL*)unmuteUserEndpointURL:(NSInteger)userId;
- (NSURL*)getUsersEndpointURL;
- (NSURL*)searchUsersEndpointURL;
- (NSURL*)getUserFolloweesEndpointURL:(NSInteger)userId;
- (NSURL*)getUserFollowersEndpointURL:(NSInteger)userId;
- (NSURL*)getUserFolloweeIdsEndpointURL:(NSInteger)userId;
- (NSURL*)getUserFollowerIdsEndpointURL:(NSInteger)userId;
- (NSURL*)getMutedUsersEndpointURL:(NSInteger)userId;
- (NSURL*)getBlockedUsersEndpointURL:(NSInteger)userId;
- (NSURL*)getRepostersEndpointURL:(NSInteger)postId;
- (NSURL*)getStarrersEndpointURL:(NSInteger)postId;
- (NSURL*)blockUserEndpointURL:(NSInteger)userId;
- (NSURL*)unblockUserEndpointURL:(NSInteger)userId;

// -- Post URL methods --
- (NSURL*)createPostEndpointURL;
- (NSURL*)getPostEndpointURL:(NSInteger)postId;
- (NSURL*)deletePostEndpointURL:(NSInteger)postId;
- (NSURL*)repostEndpointURL:(NSInteger)postId;
- (NSURL*)unrepostEndpointURL:(NSInteger)postId;
- (NSURL*)starPostEndpointURL:(NSInteger)postId;
- (NSURL*)unstarPostEndpointURL:(NSInteger)postId;
- (NSURL*)getPostsEndpointURL;
- (NSURL*)getUserPostsEndpointURL:(NSInteger)userId;
- (NSURL*)getStarredPostsEndpointURL:(NSInteger)userId;
- (NSURL*)getMentionsEndpointURL:(NSInteger)userId;
- (NSURL*)getTaggedPostsEndpointURL:(NSString*)hashtag;
- (NSURL*)getRepliesEndpointURL:(NSInteger)postId;
- (NSURL*)getPersonalStreamEndpointURL;
- (NSURL*)getUnifiedPersonalStreamEndpointURL;
- (NSURL*)getGlobalStreamEndpointURL;
- (NSURL*)reportPostEndpointURL:(NSInteger)postId;

// -- Channel URL methods --
- (NSURL*)getSubscribedChannelsEndpointURL;
- (NSURL*)createChannelEndpointURL;
- (NSURL*)getChannelEndpointURL:(NSInteger)channelId;
- (NSURL*)getChannelsEndpointURL;
- (NSURL*)updateChannelEndpointURL:(NSInteger)channelId;
- (NSURL*)subscribeToChannelEndpointURL:(NSInteger)channelId;
- (NSURL*)unsubscribeFromChannelEndpointURL:(NSInteger)channelId;
- (NSURL*)getChannelSubscribersEndpointURL:(NSInteger)channelId;
- (NSURL*)getChannelSubscriberIdsEndpointURL:(NSInteger)channelId;
- (NSURL*)getSubscribersEndpointURL;
- (NSURL*)getMutedChannelsEndpointURL;
- (NSURL*)muteChannelEndpointURL:(NSInteger)channelId;
- (NSURL*)unmuteChannelEndpointURL:(NSInteger)channelId;

// -- Message URL methods --
- (NSURL*)getChannelMessagesEndpointURL:(NSInteger)channelId;
- (NSURL*)createMessageEndpointURL:(NSInteger)channelId;
- (NSURL*)getMessageEndpointURL:(NSInteger)channelId
                      messageId:(NSInteger)messageId;
- (NSURL*)getMessagesEndpointURL;
- (NSURL*)deleteMessageEndpointURL:(NSInteger)channelId
                         messageId:(NSInteger)messageId;
- (NSURL*)getMyMessagesEndpointURL;

// -- Stream URL methods --
- (NSURL*)createStreamEndpointURL;
- (NSURL*)getStreamEndpointURL:(NSInteger)streamId;
- (NSURL*)deleteStreamEndpointURL:(NSInteger)streamId;
- (NSURL*)getAllStreamsEndpointURL;
- (NSURL*)deleteAllStreamsEndpointURL;

// -- Filter URL methods --
- (NSURL*)createFilterEndpointURL;
- (NSURL*)getFilterEndpointURL:(NSInteger)filterId;
- (NSURL*)updateFilterEndpointURL:(NSInteger)filterId;
- (NSURL*)deleteFilterEndpointURL:(NSInteger)filterId;
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
- (NSURL*)getFileEndpointURL:(NSInteger)fileId;
- (NSURL*)getFilesEndpointURL;
- (NSURL*)deleteFileEndpointURL:(NSInteger)fileId;
- (NSURL*)getMyFilesEndpointURL;
- (NSURL*)updateFileEndpointURL:(NSInteger)fileId;
- (NSURL*)updateFileContentEndpointURL:(NSInteger)fileId;

// -- Place URL methods --
- (NSURL*)getPlaceEndpointURL:(NSString*)factualId;
- (NSURL*)searchPlaceEndpointURL;

// -- Text processing --
- (NSURL*)processTextEndpointURL;

// -- Explore stream URL methods --
- (NSURL*)getAllExploreStreamsEndpointURL;
- (NSURL*)getExploreStreamEndpointURL:(NSString*)slug;

@end
