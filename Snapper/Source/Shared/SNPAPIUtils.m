//
//  SNPAPIUtils.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPAPIUtils.h"

#import "NSString+URLEscape.h"


@implementation SNPAPIUtils

CWL_SYNTHESIZE_SINGLETON_FOR_CLASS_WITH_ACCESSOR(SNPAPIUtils, sharedInstance);

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if(self) {
        _rootAPIURL = [NSURL URLWithString:@"https://api.app.net/"];
    }

    return self;
}


#pragma mark - User URL methods

- (NSURL*)getUserEndpointURL:(NSUInteger)userId {
    if(userId > 0) {
        return [NSURL URLWithString:[NSString stringWithFormat:@"users/%ld", (long)userId]
                      relativeToURL:_rootAPIURL];
    }
    return [NSURL URLWithString:@"users/me"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)updateUserEndpointURL {
    return [NSURL URLWithString:@"users/me"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getUserAvatarEndpointURL:(NSUInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"users/%ld/avatar", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)updateUserAvatarEndpointURL {
    return [NSURL URLWithString:@"users/me/avatar"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getUserCoverImageEndpointURL:(NSUInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"users/%ld/cover", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)updateUserCoverImageEndpointURL {
    return [NSURL URLWithString:@"users/me/cover"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)followUserEndpointURL:(NSUInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"users/%ld/follow", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)unfollowUserEndpointURL:(NSUInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"users/%ld/follow", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)muteUserEndpointURL:(NSUInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"users/%ld/mute", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)unmuteUserEndpointURL:(NSUInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"users/%ld/mute", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getUsersEndpointURL {
    return [NSURL URLWithString:@"users"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)searchUsersEndpointURL {
    return [NSURL URLWithString:@"users/search"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getUserFolloweesEndpointURL:(NSUInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"users/%ld/following", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getUserFollowersEndpointURL:(NSUInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"users/%ld/followers", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getUserFolloweeIdsEndpointURL:(NSUInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"users/%ld/following/ids", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getUserFollowerIdsEndpointURL:(NSUInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"users/%ld/followers/ids", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getMutedUsersEndpointURL:(NSUInteger)userId {
    if(userId > 0) {
        return [NSURL URLWithString:[NSString stringWithFormat:@"users/%ld/muted", (long)userId]
                      relativeToURL:_rootAPIURL];
    }

    return [NSURL URLWithString:@"users/me/muted"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getBlockedUsersEndpointURL:(NSUInteger)userId {
    if(userId > 0) {
        return [NSURL URLWithString:[NSString stringWithFormat:@"users/%ld/blocked", (long)userId]
                      relativeToURL:_rootAPIURL];
    }

    return [NSURL URLWithString:@"users/me/blocked"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getRepostersEndpointURL:(NSUInteger)postId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"posts/%ld/reposters", (long)postId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getStarrersEndpointURL:(NSUInteger)postId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"posts/%ld/stars", (long)postId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)blockUserEndpointURL:(NSUInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"users/%ld/block", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)unblockUserEndpointURL:(NSUInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"users/%ld/block", (long)userId]
                  relativeToURL:_rootAPIURL];
}


#pragma mark - Post URL methods

- (NSURL*)createPostEndpointURL {
    return [NSURL URLWithString:@"posts"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getPostEndpointURL:(NSUInteger)postId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"posts/%ld", (long)postId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)deletePostEndpointURL:(NSUInteger)postId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"posts/%ld", (long)postId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)repostEndpointURL:(NSUInteger)postId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"posts/%ld/repost", (long)postId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)unrepostEndpointURL:(NSUInteger)postId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"posts/%ld/repost", (long)postId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)starPostEndpointURL:(NSUInteger)postId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"posts/%ld/star", (long)postId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)unstarPostEndpointURL:(NSUInteger)postId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"posts/%ld/star", (long)postId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getPostsEndpointURL {
    return [NSURL URLWithString:@"posts"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getUserPostsEndpointURL:(NSUInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"users/%ld/posts", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getStarredPostsEndpointURL:(NSUInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"users/%ld/stars", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getMentionsEndpointURL:(NSUInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"users/%ld/mentions", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getTaggedPostsEndpointURL:(NSString*)hashtag {
    return [NSURL URLWithString:[NSString stringWithFormat:@"posts/tag/%@", [hashtag stringByEscapingValidURLCharacters]]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getRepliesEndpointURL:(NSUInteger)postId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"posts/%ld/replies", (long)postId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getPersonalStreamEndpointURL {
    return [NSURL URLWithString:@"posts/stream"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getUnifiedPersonalStreamEndpointURL {
    return [NSURL URLWithString:@"posts/stream/unified"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getGlobalStreamEndpointURL {
    return [NSURL URLWithString:@"posts/stream/global"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)reportPostEndpointURL:(NSUInteger)postId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"posts/%ld/report", (long)postId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)searchEndpointURL {
    return [NSURL URLWithString:@"posts/search"
                  relativeToURL:_rootAPIURL];
}


#pragma mark - Channel URL methods

- (NSURL*)getSubscribedChannelsEndpointURL {
    return [NSURL URLWithString:@"channels"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)createChannelEndpointURL {
    return [NSURL URLWithString:@"channels"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getChannelEndpointURL:(NSUInteger)channelId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"channels/%ld", (long)channelId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getChannelsEndpointURL {
    return [NSURL URLWithString:@"channels"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getMyChannelsEndpointURL {
    return [NSURL URLWithString:@"users/me/channels"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)updateChannelEndpointURL:(NSUInteger)channelId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"channels/%ld", (long)channelId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)subscribeToChannelEndpointURL:(NSUInteger)channelId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"channels/%ld/subscribe", (long)channelId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)unsubscribeFromChannelEndpointURL:(NSUInteger)channelId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"channels/%ld/subscribe", (long)channelId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getChannelSubscribersEndpointURL:(NSUInteger)channelId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"channels/%ld/subscribers", (long)channelId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getChannelSubscriberIdsEndpointURL:(NSUInteger)channelId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"channels/%ld/subscribers/ids", (long)channelId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getSubscribersEndpointURL {
    return [NSURL URLWithString:@"channels/subscribers/ids"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getMutedChannelsEndpointURL {
    return [NSURL URLWithString:@"users/me/channels/muted"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)muteChannelEndpointURL:(NSUInteger)channelId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"channels/%ld/mute", (long)channelId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)unmuteChannelEndpointURL:(NSUInteger)channelId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"channels/%ld/mute", (long)channelId]
                  relativeToURL:_rootAPIURL];
}


#pragma mark - Message URL methods

- (NSURL*)getChannelMessagesEndpointURL:(NSUInteger)channelId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"channels/%ld/messages", (long)channelId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)createMessageEndpointURL:(NSUInteger)channelId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"channels/%ld/messages", (long)channelId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)createPMMessageEndpointURL {
    return [NSURL URLWithString:@"channels/pm/messages"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getMessageEndpointURL:(NSUInteger)channelId
                      messageId:(NSUInteger)messageId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"channels/%ld/messages/%ld", (long)channelId, (long)messageId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getMessagesEndpointURL {
    return [NSURL URLWithString:@"channels/messages"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)deleteMessageEndpointURL:(NSUInteger)channelId
                         messageId:(NSUInteger)messageId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"channels/%ld/messages/%ld", (long)channelId, (long)messageId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getMyMessagesEndpointURL {
    return [NSURL URLWithString:@"users/me/messages"
                  relativeToURL:_rootAPIURL];
}


#pragma mark - Stream URL methods

- (NSURL*)createStreamEndpointURL {
    return [NSURL URLWithString:@"streams"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getStreamEndpointURL:(NSUInteger)streamId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"streams/%ld", (long)streamId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)deleteStreamEndpointURL:(NSUInteger)streamId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"streams/%ld", (long)streamId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getAllStreamsEndpointURL {
    return [NSURL URLWithString:@"streams"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)deleteAllStreamsEndpointURL {
    return [NSURL URLWithString:@"streams"
                  relativeToURL:_rootAPIURL];
}


#pragma mark - Filter URL methods

- (NSURL*)createFilterEndpointURL {
    return [NSURL URLWithString:@"filters"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getFilterEndpointURL:(NSUInteger)filterId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"filters/%ld", (long)filterId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)updateFilterEndpointURL:(NSUInteger)filterId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"filters/%ld", (long)filterId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)deleteFilterEndpointURL:(NSUInteger)filterId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"filters/%ld", (long)filterId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getFiltersEndpointURL {
    return [NSURL URLWithString:@"filters"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)deleteFiltersEndpointURL {
    return [NSURL URLWithString:@"filters"
                  relativeToURL:_rootAPIURL];
}


#pragma mark - Interaction URL methods

- (NSURL*)getInteractionsEndpointURL {
    return [NSURL URLWithString:@"users/me/interactions"
                  relativeToURL:_rootAPIURL];
}


#pragma mark - Stream Marker URL methods

- (NSURL*)updateStreamMarkerEndpointURL {
    return [NSURL URLWithString:@"posts/marker"
                  relativeToURL:_rootAPIURL];
}


#pragma mark - Token URL methods

- (NSURL*)tokenEndpointURL {
    return [NSURL URLWithString:@"token"
                  relativeToURL:_rootAPIURL];
}


#pragma mark - File URL methods

- (NSURL*)createFileEndpointURL {
    return [NSURL URLWithString:@"files"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getFileEndpointURL:(NSUInteger)fileId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"files/%ld", (long)fileId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getFilesEndpointURL {
    return [NSURL URLWithString:@"files"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)deleteFileEndpointURL:(NSUInteger)fileId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"files/%ld", (long)fileId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getMyFilesEndpointURL {
    return [NSURL URLWithString:@"users/me/files"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)updateFileEndpointURL:(NSUInteger)fileId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"files/%ld", (long)fileId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)updateFileContentEndpointURL:(NSUInteger)fileId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"files/%ld/content", (long)fileId]
                  relativeToURL:_rootAPIURL];
}


#pragma mark - Place URL methods

- (NSURL*)getPlaceEndpointURL:(NSString*)factualId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"places/%@", factualId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)searchPlaceEndpointURL {
    return [NSURL URLWithString:@"places/search"
                  relativeToURL:_rootAPIURL];
}


#pragma mark - Text processing

- (NSURL*)processTextEndpointURL {
    return [NSURL URLWithString:@"text/process"
                  relativeToURL:_rootAPIURL];
}


#pragma mark - Explore stream URL methods

- (NSURL*)getAllExploreStreamsEndpointURL {
    return [NSURL URLWithString:@"posts/stream/explore"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getExploreStreamEndpointURL:(NSString*)slug {
    return [NSURL URLWithString:[NSString stringWithFormat:@"posts/stream/explore/%@", slug]
                  relativeToURL:_rootAPIURL];
}


#pragma mark - Configuration methods

- (NSURL*)configurationEndpointURL {
    return [NSURL URLWithString:@"config"
                  relativeToURL:_rootAPIURL];
}

@end
