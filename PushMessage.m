//
//  PushMessage.m
//  EphoneApiDemo
//
//  Created by kennethwu on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PushMessage.h"

@implementation PushMessage
@synthesize msgType = _msgType;
@synthesize push_content = _push_content;
@synthesize content = _content;

- (id)initWithMsgType:(int)msgType
          PushContent:(NSString*)push_content
              Content:(NSString*)content
{
    if ((self = [super init])) {
        self.msgType = msgType;
        self.push_content = push_content;
        self.content = content;
    }
    return self;
}

- (void) dealloc {
    self.push_content = nil;
    self.content = nil;    
    [super dealloc];
}

@end
