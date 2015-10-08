//
//  SNPAnnotation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>


#define SNP_ANNOTATION_TYPE_CORE_CROSSPOST (@"net.app.core.crosspost")
#define SNP_ANNOTATION_TYPE_CORE_OEMBED (@"net.app.core.oembed")
#define SNP_ANNOTATION_TYPE_CORE_GEOLOCATION (@"net.app.core.geolocation")
#define SNP_ANNOTATION_TYPE_CORE_LANGUAGE (@"net.app.core.language")
#define SNP_ANNOTATION_TYPE_CORE_BLOG (@"net.app.core.directory.blog")
#define SNP_ANNOTATION_TYPE_CORE_FACEBOOK (@"net.app.core.directory.facebook")
#define SNP_ANNOTATION_TYPE_CORE_TWITTER (@"net.app.core.directory.twitter")
#define SNP_ANNOTATION_TYPE_CORE_HOMEPAGE (@"net.app.core.directory.homepage")

/**
 * Represents an annotation.
 *
 * Note that because of the open nature of annotations, the 'value' property is
 * simply a dictionary.
 */
@interface SNPAnnotation : MTLModel
<MTLJSONSerializing>

@property (nonatomic, nonnull, copy) NSString* type;
@property (nonatomic, nonnull, copy) NSDictionary* value;

@end
