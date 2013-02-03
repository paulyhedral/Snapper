//
//  ModelTests.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "ModelTests.h"

#import <Snapper/Snapper.h>


@implementation ModelTests

- (void)setUp {
    [super setUp];
}

- (void)testUserFromJSON {

    NSDictionary* userDict = [self loadJSONFromFile:@"user"];

    SNPUser* user = [SNPUser modelWithExternalRepresentation:userDict];
    STAssertNotNil(user, @"Unable to create user from JSON");

    STAssertTrue(user.userId == 1199, @"User ID should be 1199");
    STAssertTrue([user.username isEqualToString:@"pilgrim"], @"Username should be 'pilgrim'");
    STAssertTrue([user.annotations count] == 9, @"User should have 9 annotations");
    STAssertTrue([user.description.links count] == 2, @"User's description should have 2 link entities");
    STAssertTrue([user.createdAt timeIntervalSince1970] > 0, @"User's created date should not be 0");
    STAssertTrue(user.postsCount == 4077, @"User should have 4077 posts");
    STAssertNotNil(user.avatarImage, @"User should have an avatar image");
    STAssertNotNil(user.avatarImage.URL, @"User should have an avatar image URL");
    STAssertNotNil(user.coverImage, @"User should have a cover image");
    STAssertNotNil(user.coverImage.URL, @"User should have a cover image URL");
    STAssertTrue([[user.canonicalURL absoluteString] isEqualToString:@"https://alpha.app.net/pilgrim"], @"User's canonical URL is not set correctly");
}

- (void)testPostFromJSON {

    NSDictionary* postDict = [self loadJSONFromFile:@"post"];

    SNPPost* post = [SNPPost modelWithExternalRepresentation:postDict];
    STAssertNotNil(post, @"Unable to create post from JSON");


}

- (void)testACLFromJSON {

    NSDictionary* aclDict = [self loadJSONFromFile:@"acl"];

    SNPACL* acl = [SNPACL modelWithExternalRepresentation:aclDict];
    STAssertNotNil(acl, @"Unable to create ACL from JSON");

    STAssertTrue(acl.anyUser == NO, @"ACL 'anyUser' property should be NO");
    STAssertTrue(acl.immutable == YES, @"ACL 'immutable' property should be YES");
    STAssertTrue(acl.public_ == NO, @"ACL 'public_' property should be NO");
    STAssertTrue([acl.userIds count] == 2, @"ACL 'userIds' array should have 2 items");
    STAssertTrue(acl.you == YES, @"ACL 'you' property should be YES");
}

- (void)testAnnotationFromJSON {

    NSDictionary* annotationDict = [self loadJSONFromFile:@"annotation"];

    SNPAnnotation* annotation = [SNPAnnotation modelWithExternalRepresentation:annotationDict];
    STAssertNotNil(annotation, @"Unable to create annotation from JSON");

    STAssertTrue([annotation.type isEqualToString:@"com.pilgrimagesoftware.yawp.client"], @"Annotation 'type' property should be 'com.pilgrimagesoftware.yawp.client'");
    STAssertTrue([annotation.value isKindOfClass:[NSDictionary class]], @"Annotation 'value' property should be an NSDictionary");
    STAssertTrue([[annotation.value allKeys] count] == 5, @"Annotation's 'value' property dictionary should have 5 keys (actually has %d)", [[annotation.value allKeys] count]);
    STAssertTrue([annotation.value[@"name"] isEqualToString:@"com.pilgrimagesoftware.yawp"], @"Annotation's 'value' property dictionary key 'name' should have value 'com.pilgrimagesoftware.yawp' (actually has '%@')", annotation.value[@"name"]);
}

- (void)testChannelFromJSON {

    NSDictionary* channelDict = [self loadJSONFromFile:@"channel"];

    SNPChannel* channel = [SNPChannel modelWithExternalRepresentation:channelDict];
    STAssertNotNil(channel, @"Unable to create channel from JSON");

    STAssertTrue(channel.channelId == 1, @"Channel 'id' property should be 1");
    STAssertNotNil(channel.owner, @"Channel 'owner' property should not be nil");
    STAssertTrue(channel.owner.userId == 1199, @"Channel 'owner.userId' property should be 1199");
    STAssertNotNil(channel.readers, @"Channel 'readers' property should not be nil");
    STAssertTrue(channel.recentMessageId == 231, @"Channel 'recentMessageId' property should be 231");
    STAssertTrue([channel.type isEqualToString:SNP_CHANNEL_TYPE_PM], @"Channel 'type' property should be set to constant value '%@' (actually is '%@')", SNP_CHANNEL_TYPE_PM, channel.type);
    STAssertNotNil(channel.writers, @"Channel 'writers' property should not be nil");
    STAssertTrue(channel.youCanEdit == NO, @"Channel 'youCanEdit' property should be NO");
    STAssertTrue(channel.youSubscribed == YES, @"Channel 'youSubscribed' property should be YES");
}

- (void)testDescriptionFromJSON {

    NSDictionary* descriptionDict = [self loadJSONFromFile:@"description"];

    SNPDescription* description = [SNPDescription modelWithExternalRepresentation:descriptionDict];
    STAssertNotNil(description, @"Unable to create description from JSON");

    STAssertTrue([description.links count] == 2, @"Description 'links' property should have 2 items");
    STAssertNotNil(description.hashtags, @"Description 'hashtags' property should not be nil");
    STAssertNotNil(description.mentions, @"Description 'mentions' property should not be nil");
    STAssertNotNil(description.text, @"Description 'text' property should not be nil");
    STAssertNotNil(description.html, @"Description 'html' property should not be nil");
}

- (void)testFilterFromJSON {

    NSDictionary* filterDict = [self loadJSONFromFile:@"filter"];

    SNPFilter* filter = [SNPFilter modelWithExternalRepresentation:filterDict];
    STAssertNotNil(filter, @"Unable to create filter from JSON");

    STAssertTrue([filter.clauses count] == 1, @"Filter 'clauses' property should have 1 item");
    STAssertTrue(filter.filterId == 1, @"Filter 'filterId' property should be 1");
    STAssertTrue(filter.matchPolicy == SNPFilterMatchPolicyIncludeAny, @"Filter 'matchPolicy' property should be set to 'include_any'");
    STAssertNotNil(filter.name, @"Filter 'name' property should not be nil");
}

- (void)testFilterClauseFromJSON {

    NSDictionary* filterClauseDict = [self loadJSONFromFile:@"filter-clause"];

    SNPFilterClause* filterClause = [SNPFilterClause modelWithExternalRepresentation:filterClauseDict];
    STAssertNotNil(filterClause, @"Unable to create filter clause from JSON");

    STAssertNotNil(filterClause.field, @"Filter clause 'field' property should not be nil");
    STAssertTrue(filterClause.objectType == SNPFilterClauseObjectTypePost, @"Filter clause 'objectType' property should be set to 'post'");
    STAssertTrue(filterClause.op == SNPFilterClauseOperatorMatches, @"Filter clause 'op' property should be set to 'matches'");
    STAssertTrue([filterClause.value isEqualToString:@"rollout"], @"Filter clause 'value' property should be 'rollout'");
}

- (void)testHashtagFromJSON {

    NSDictionary* hashtagDict = [self loadJSONFromFile:@"hashtag"];

    SNPHashtag* hashtag = [SNPHashtag modelWithExternalRepresentation:hashtagDict];
    STAssertNotNil(hashtag, @"Unable to create hashtag from JSON");

    STAssertTrue([hashtag.name isEqualToString:@"coffee"], @"Hashtag 'name' property should be set to 'coffee'");
    STAssertTrue(hashtag.length == 7, @"Hashtag 'length' property should be 7");
    STAssertTrue(hashtag.position == 79, @"Hashtag 'position' property should be 79");
}

- (void)testImageFromJSON {

    NSDictionary* imageDict = [self loadJSONFromFile:@"image"];

    SNPImage* image = [SNPImage modelWithExternalRepresentation:imageDict];
    STAssertNotNil(image, @"Unable to create image from JSON");

    STAssertTrue(image.height == 976, @"Image 'height' property should be 976");
    STAssertNotNil(image.URL, @"Image 'URL' property should not be nil");
    STAssertTrue(image.width == 1422, @"Image 'width' property should be 1422");
}

- (void)testRepostInteractionFromJSON {

    NSDictionary* interactionDict = [self loadJSONFromFile:@"interaction-repost"];

    SNPInteraction* interaction = [SNPInteraction modelWithExternalRepresentation:interactionDict];
    STAssertNotNil(interaction, @"Unable to create post-based interaction from JSON");

    STAssertTrue(interaction.action == SNPInteractionActionRepost, @"Repost interaction 'action' property should be 'repost'");
    STAssertTrue([interaction.objects count] == 1, @"Repost interaction 'objects' property should have 1 item");
    STAssertTrue([interaction.users count] == 1, @"Repost interaction 'users' property should have 1 item");
}

- (void)testFollowInteractionFromJSON {

    NSDictionary* interactionDict = [self loadJSONFromFile:@"interaction-follow"];

    SNPInteraction* interaction = [SNPInteraction modelWithExternalRepresentation:interactionDict];
    STAssertNotNil(interaction, @"Unable to create user-based interaction from JSON");

    STAssertTrue(interaction.action == SNPInteractionActionFollow, @"Follow interaction 'action' property should be 'follow'");
    STAssertTrue([interaction.objects count] == 1, @"Follow interaction 'objects' property should have 1 item");
    STAssertTrue([interaction.users count] == 1, @"Follow interaction 'users' property should have 1 item");
}

- (void)testLinkFromJSON {

    NSDictionary* linkDict = [self loadJSONFromFile:@"link"];

    SNPLink* link = [SNPLink modelWithExternalRepresentation:linkDict];
    STAssertNotNil(link, @"Unable to create link from JSON");

    STAssertTrue(link.length == 7, @"Link 'length' property should be 7");
    STAssertTrue(link.position == 73, @"Link 'position' property should be 73");
    STAssertTrue([link.text isEqualToString:@"App.net"], @"Link 'text' property should be 'App.net'");
    STAssertNotNil(link.URL, @"Link 'URL' property should not be nil");
}

- (void)testMentionFromJSON {

    NSDictionary* mentionDict = [self loadJSONFromFile:@"mention"];

    SNPMention* mention = [SNPMention modelWithExternalRepresentation:mentionDict];
    STAssertNotNil(mention, @"Unable to create mention from JSON");

    STAssertTrue(mention.userId == 5463, @"Mention 'userId' property should be 5463");
    STAssertTrue(mention.length == 13, @"Mention 'length' property should be 13");
    STAssertTrue([mention.name isEqualToString:@"sethclifford"], @"Mention 'name' property should be 'sethclifford'");
    STAssertTrue(mention.position == 0, @"Mention 'position' property should be 0");
}

- (void)testMessageFromJSON {

    NSDictionary* messageDict = [self loadJSONFromFile:@"message"];

    SNPMessage* message = [SNPMessage modelWithExternalRepresentation:messageDict];
    STAssertNotNil(message, @"Unable to create message from JSON");

    STAssertTrue(message.messageId == 103, @"Message 'messageId' property should be 103");
    STAssertTrue(message.channelId == 1, @"Message 'channelId' property should be 1");
    STAssertNotNil(message.user, @"Message 'user' property should not be nil");
    STAssertTrue([message.user.annotations count] == 9, @"Message 'user.annotations' property should have 9 items");
}

- (void)testStreamFromJSON {

    NSDictionary* streamDict = [self loadJSONFromFile:@"stream"];

    SNPStream* stream = [SNPStream modelWithExternalRepresentation:streamDict];
    STAssertNotNil(stream, @"Unable to create stream from JSON");

    STAssertNotNil(stream.endpoint, @"Stream 'endpoint' property should not be nil");
    STAssertNotNil(stream.filter, @"Stream 'filter' property should not be nil");
    STAssertTrue(stream.streamId == 1, @"Stream 'streamId' property should be 1");
    STAssertTrue([stream.objectTypes count] == 1, @"Stream 'objectTypes' property should have 1 item");
    STAssertTrue([stream.objectTypes[0] isEqualToString:@"post"], @"Stream 'objectTypes' index 0 value should be 'post'");
    STAssertTrue(stream.type == SNPStreamTypeLongPoll, @"Stream 'type' property should be 'long_poll'");
    STAssertTrue([stream.key isEqualToString:@"rollout_stream"], @"Stream 'key' property should be 'rollout_stream'");
}

- (void)testStreamMarkerFromJSON {

    NSDictionary* markerDict = [self loadJSONFromFile:@"stream-marker"];

    SNPStreamMarker* streamMarker = [SNPStreamMarker modelWithExternalRepresentation:markerDict];
    STAssertNotNil(streamMarker, @"Unable to create marker from JSON");

    STAssertTrue(streamMarker.postId == 1234, @"Stream marker 'postId' property should be 1234");
    STAssertTrue([streamMarker.name isEqualToString:@"global"], @"Stream marker 'name' should be 'global'");
    STAssertTrue(streamMarker.percentage == 0, @"Stream marker 'percentage' property should be 0");
    STAssertNotNil(streamMarker.updatedAt, @"Stream marker 'updatedAt' property should not be nil");
    STAssertTrue([streamMarker.version isEqualToString:@"NWoZK3kTsExUV00Ywo1G5jlUKKs"], @"Stream marker 'version' property should be 'NWoZK3kTsExUV00Ywo1G5jlUKKs'");
}

- (void)testTokenFromJSON {

    NSDictionary* tokenDict = [self loadJSONFromFile:@"token"];

    SNPToken* token = [SNPToken modelWithExternalRepresentation:tokenDict];
    STAssertNotNil(token, @"Unable to create token from JSON");

    STAssertTrue([token.clientId isEqualToString:@"udxGzAVBdXwGtkHmvswR5MbMEeVnq6n4"], @"Token 'clientId' property should be set to 'udxGzAVBdXwGtkHmvswR5MbMEeVnq6n4'");
    STAssertTrue([token.appClientId isEqualToString:@"udxGzAVBdXwGtkHmvswR5MbMEeVnq6n4"], @"Token 'appClientId' property should be set to 'udxGzAVBdXwGtkHmvswR5MbMEeVnq6n4'");
    STAssertTrue([token.scopes count] == 6, @"Token 'scopes' property should have 6 items");
    STAssertNotNil(token.user, @"Token 'user' property should not be nil");
    STAssertTrue(token.user.userId == 1, @"Token 'user.userId' should be 1");
}

- (void)testFileFromJSON {

    NSDictionary* fileDict = [self loadJSONFromFile:@"file"];

    SNPFile* file = [SNPFile modelWithExternalRepresentation:fileDict];
    STAssertNotNil(file, @"Unable to create file from JSON");

    STAssertTrue(file.complete == YES, @"File 'complete' property should be 'true'");
    STAssertTrue([file.fileToken isEqualToString:@"auCj3h64JZrhQ9aJdmwre3KP-QL9UtWHYvt5tj_64rUJWemoIV2W8eTJv9NMaGpBFk-BbU_aWA26Q40w4jFhiPBpnIQ_lciLwfh6o8YIAQGEQziksUMxZo7gOHJ_-niw3l3MZCh7QRWzqNGpiVaUEptfKO0fETrZ8bJjDa61234a"], @"File 'fileToken' property should be set to 'auCj3h64JZrhQ9aJdmwre3KP-QL9UtWHYvt5tj_64rUJWemoIV2W8eTJv9NMaGpBFk-BbU_aWA26Q40w4jFhiPBpnIQ_lciLwfh6o8YIAQGEQziksUMxZo7gOHJ_-niw3l3MZCh7QRWzqNGpiVaUEptfKO0fETrZ8bJjDa61234a'");
    STAssertTrue(file.fileId == 1, @"File 'fileId' property should be set to '1'");
    STAssertTrue(file.kind == SNPFileKindImage, @"File 'kind' property should be set to 'image'");
    STAssertNotNil(file.source, @"File 'source' property should not be nil");
    STAssertNotNil(file.URL, @"File 'URL' property should not be nil");
    STAssertNotNil(file.URLExpires, @"File 'URLExpires' property should not be nil");
    STAssertNotNil(file.user, @"File 'user' property should not be nil");

    STAssertTrue([[file.derivedFiles allKeys] count] == 2, @"File 'derivedFiles' property should contain 2 keys");
    STAssertNotNil(file.derivedFiles[@"image_thumb_200s"], @"File 'derivedFiles' property key 'image_thumb_200s' should not be nil");
    STAssertNotNil(file.derivedFiles[@"image_thumb_960r"], @"File 'derivedFiles' property key 'image_thumb_960r' should not be nil");

    SNPDerivedFile* derivedFile = file.derivedFiles[@"image_thumb_200s"];

    STAssertNotNil(derivedFile.URL, @"Derived file 'URL' property should not be nil");
    STAssertNotNil(derivedFile.URLExpires, @"Derived file 'URLExpires' property should not be nil");
}

- (NSDictionary*)loadJSONFromFile:(NSString*)name {

    NSBundle* bundle = [NSBundle bundleForClass:[self class]];
    NSString *filePath = [bundle pathForResource:name
                                          ofType:@"json"];
    NSData* data = [[NSData alloc] initWithContentsOfFile:filePath];
    STAssertNotNil(data, @"No data loaded from file: %@", filePath);
    NSError* error = nil;
    NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:data
                                                             options:0
                                                               error:&error];
    STAssertNotNil(jsonDict, @"Unable to convert JSON data to dictionary: %@", error);
    
    return jsonDict;
}

@end
