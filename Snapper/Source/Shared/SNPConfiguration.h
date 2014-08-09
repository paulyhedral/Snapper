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
@property (nonatomic, assign) NSInteger textUriTemplateLengthPostId;
@property (nonatomic, assign) NSInteger textUriTemplateLengthMessageId;
@property (nonatomic, assign) NSInteger userAnnotationMaxBytes;
@property (nonatomic, assign) NSInteger userTextMaxLength;
@property (nonatomic, assign) NSInteger fileAnnotationMaxBytes;
@property (nonatomic, assign) NSInteger postAnnotationMaxBytes;
@property (nonatomic, assign) NSInteger postTextMaxLength;
@property (nonatomic, assign) NSInteger messageAnnotationMaxBytes;
@property (nonatomic, assign) NSInteger messageTextMaxLength;
@property (nonatomic, assign) NSInteger channelAnnotationMaxBytes;

@end
