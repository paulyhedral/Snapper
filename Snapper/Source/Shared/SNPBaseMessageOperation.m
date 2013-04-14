//
//  SNPBaseMessageOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 3/26/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseMessageOperation.h"


@implementation SNPBaseMessageOperation

- (void)main {

    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];

    if(self.parameters) {
        [parameters addEntriesFromDictionary:self.parameters];
    }

    if(_includeMessageAnnotations) {
        parameters[@"include_message_annotations"] = @(_includeMessageAnnotations);
    }
    if(_channelTypes) {
        parameters[@"channel_types"] = [_channelTypes componentsJoinedByString:@","];
    }

    if([[parameters allKeys] count]) {
        self.parameters = parameters;
    }

    [super main];
}

@end
