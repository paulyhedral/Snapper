//
//  SNPConfiguration.h
//  Snapper
//
//  Created by Paul Schifferer on 8/13/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>


@interface SNPConfiguration : MTLModel
<MTLJSONSerializing>

// -- Properties --
@property (nonatomic, assign) NSUInteger textUriTemplateLengthPostId;
@property (nonatomic, assign) NSUInteger textUriTemplateLengthMessageId;
@property (nonatomic, assign) NSUInteger userAnnotationMaxBytes;
@property (nonatomic, assign) NSUInteger userTextMaxLength;
@property (nonatomic, assign) NSUInteger fileAnnotationMaxBytes;
@property (nonatomic, assign) NSUInteger postAnnotationMaxBytes;
@property (nonatomic, assign) NSUInteger postTextMaxLength;
@property (nonatomic, assign) NSUInteger messageAnnotationMaxBytes;
@property (nonatomic, assign) NSUInteger messageTextMaxLength;
@property (nonatomic, assign) NSUInteger channelAnnotationMaxBytes;

@end
