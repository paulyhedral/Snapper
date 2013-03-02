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

CWL_SYNTHESIZE_SINGLETON_FOR_CLASS_WITH_ACCESSOR(SNPAPIUtils, sharedAPIUtils);

#pragma mark - Initialization

- (id)init {
    self = [super init];
    if(self) {
        _rootAPIURL = [NSURL URLWithString:@"https://alpha-api.app.net/stream/0"];
    }

    return self;
}


#pragma mark - User URL methods

- (NSURL*)getUserEndpointURL:(NSInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/users/%ld", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)updateUserEndpointURL {
    return [NSURL URLWithString:@"/users/me"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getUserAvatarEndpointURL:(NSInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/users/%ld/avatar", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)updateUserAvatarEndpointURL {
    return [NSURL URLWithString:@"/users/me/avatar"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getUserCoverImageEndpointURL:(NSInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/users/%ld/cover", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)updateUserCoverImageEndpointURL {
    return [NSURL URLWithString:@"/users/me/cover"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)followUserEndpointURL:(NSInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/users/%ld/follow", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)unfollowUserEndpointURL:(NSInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/users/%ld/follow", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)muteUserEndpointURL:(NSInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/users/%ld/mute", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)unmuteUserEndpointURL:(NSInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/users/%ld/mute", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getUsersEndpointURL {
    return [NSURL URLWithString:@"/users"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)searchUsersEndpointURL {
    return [NSURL URLWithString:@"/users/search"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getUserFolloweesEndpointURL:(NSInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/users/%ld/following", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getUserFollowersEndpointURL:(NSInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/users/%ld/followers", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getUserFolloweeIdsEndpointURL:(NSInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/users/%ld/following/ids", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getUserFollowerIdsEndpointURL:(NSInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/users/%ld/followers/ids", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getMutedUsersEndpointURL {
    return [NSURL URLWithString:@"/users/me/muted"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getRepostersEndpointURL:(NSInteger)postId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/posts/%ld/reposters", (long)postId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getStarrersEndpointURL:(NSInteger)postId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/posts/%ld/stars", (long)postId]
                  relativeToURL:_rootAPIURL];
}


#pragma mark - Post URL methods

- (NSURL*)createPostEndpointURL {
    return [NSURL URLWithString:@"/posts"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getPostEndpointURL:(NSInteger)postId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/posts/%ld", (long)postId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)deletePostEndpointURL:(NSInteger)postId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/posts/%ld", (long)postId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)repostEndpointURL:(NSInteger)postId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/posts/%ld/repost", (long)postId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)unrepostEndpointURL:(NSInteger)postId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/posts/%ld/repost", (long)postId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)starPostEndpointURL:(NSInteger)postId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/posts/%ld/star", (long)postId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)unstarPostEndpointURL:(NSInteger)postId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/posts/%ld/star", (long)postId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getPostsEndpointURL {
    return [NSURL URLWithString:@"/posts"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getUserPostsEndpointURL:(NSInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/users/%ld/posts", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getStarredPostsEndpointURL:(NSInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/users/%ld/stars", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getMentionsEndpointURL:(NSInteger)userId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/users/%ld/mentions", (long)userId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getTaggedPostsEndpointURL:(NSString*)hashtag {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/posts/tag/%@", [hashtag stringByEscapingValidURLCharacters]]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getRepliesEndpointURL:(NSInteger)postId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/posts/%ld/replies", (long)postId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getPersonalStreamEndpointURL {
    return [NSURL URLWithString:@"/posts/stream"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getUnifiedPersonalStreamEndpointURL {
    return [NSURL URLWithString:@"/posts/stream/unified"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getGlobalStreamEndpointURL {
    return [NSURL URLWithString:@"/posts/stream/global"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)reportPostEndpointURL:(NSInteger)postId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/posts/%ld/report", (long)postId]
                  relativeToURL:_rootAPIURL];
}


#pragma mark - Channel URL methods

- (NSURL*)getSubscribedChannelsEndpointURL {
    return [NSURL URLWithString:@"/channels"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)createChannelEndpointURL {
    return [NSURL URLWithString:@"/channels"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getChannelEndpointURL:(NSInteger)channelId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/channels/%ld", (long)channelId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getChannelsEndpointURL {
    return [NSURL URLWithString:@"/channels"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)updateChannelEndpointURL:(NSInteger)channelId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/channels/%ld", (long)channelId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)subscribeToChannelEndpointURL:(NSInteger)channelId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/channels/%ld/subscribe", (long)channelId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)unsubscribeFromChannelEndpointURL:(NSInteger)channelId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/channels/%ld/subscribe", (long)channelId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getChannelSubscribersEndpointURL:(NSInteger)channelId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/channels/%ld/subscribers", (long)channelId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getChannelSubscriberIdsEndpointURL:(NSInteger)channelId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/channels/%ld/subscribers/ids", (long)channelId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getSubscribersEndpointURL {
    return [NSURL URLWithString:@"/channels/subscribers/ids"
                  relativeToURL:_rootAPIURL];
}


#pragma mark - Message URL methods

- (NSURL*)getChannelMessagesEndpointURL:(NSInteger)channelId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/channels/%ld/messages", (long)channelId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)createMessageEndpointURL:(NSInteger)channelId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/channels/%ld/messages", (long)channelId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getMessageEndpointURL:(NSInteger)channelId
                      messageId:(NSInteger)messageId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/channels/%ld/messages/%ld", (long)channelId, (long)messageId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getMessagesEndpointURL {
    return [NSURL URLWithString:@"/channels/messages"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)deleteMessageEndpointURL:(NSInteger)channelId
                         messageId:(NSInteger)messageId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/channels/%ld/messages/%ld", (long)channelId, (long)messageId]
                  relativeToURL:_rootAPIURL];
}


#pragma mark - Stream URL methods

- (NSURL*)createStreamEndpointURL {
    return [NSURL URLWithString:@"/streams"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getStreamEndpointURL:(NSInteger)streamId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/streams/%ld", (long)streamId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)deleteStreamEndpointURL:(NSInteger)streamId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/streams/%ld", (long)streamId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getAllStreamsEndpointURL {
    return [NSURL URLWithString:@"/streams"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)deleteAllStreamsEndpointURL {
    return [NSURL URLWithString:@"/streams"
                  relativeToURL:_rootAPIURL];
}


#pragma mark - Filter URL methods

- (NSURL*)createFilterEndpointURL {
    return [NSURL URLWithString:@"/filters"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getFilterEndpointURL:(NSInteger)filterId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/filters/%ld", (long)filterId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)updateFilterEndpointURL:(NSInteger)filterId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/filters/%ld", (long)filterId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)deleteFilterEndpointURL:(NSInteger)filterId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/filters/%ld", (long)filterId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getFiltersEndpointURL {
    return [NSURL URLWithString:@"/filters"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)deleteFiltersEndpointURL {
    return [NSURL URLWithString:@"/filters"
                  relativeToURL:_rootAPIURL];
}


#pragma mark - Interaction URL methods

- (NSURL*)getInteractionsEndpointURL {
    return [NSURL URLWithString:@"/users/me/interactions"
                  relativeToURL:_rootAPIURL];
}


#pragma mark - Stream Marker URL methods

- (NSURL*)updateStreamMarkerEndpointURL {
    return [NSURL URLWithString:@"/posts/marker"
                  relativeToURL:_rootAPIURL];
}


#pragma mark - Token URL methods

- (NSURL*)tokenEndpointURL {
    return [NSURL URLWithString:@"token"
                  relativeToURL:_rootAPIURL];
}


#pragma mark - File URL methods

- (NSURL*)createFileEndpointURL {
    return [NSURL URLWithString:@"/files"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getFileEndpointURL:(NSInteger)fileId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/files/%ld", (long)fileId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getFilesEndpointURL {
    return [NSURL URLWithString:@"/files"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)deleteFileEndpointURL:(NSInteger)fileId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/files/%ld", (long)fileId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)getMyFilesEndpointURL {
    return [NSURL URLWithString:@"/users/me/files"
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)updateFileEndpointURL:(NSInteger)fileId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/files/%ld", (long)fileId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)updateFileContentEndpointURL:(NSInteger)fileId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/files/%ld/content", (long)fileId]
                  relativeToURL:_rootAPIURL];
}


#pragma mark - Place URL methods

- (NSURL*)getPlaceEndpointURL:(NSString*)factualId {
    return [NSURL URLWithString:[NSString stringWithFormat:@"/places/%@", factualId]
                  relativeToURL:_rootAPIURL];
}

- (NSURL*)searchPlaceEndpointURL {
    return [NSURL URLWithString:@"/places/search"
                  relativeToURL:_rootAPIURL];
}


#pragma mark - Text processing

- (NSURL*)processTextEndpointURL {
    return [NSURL URLWithString:@"/text/process"
                  relativeToURL:_rootAPIURL];
}

@end
