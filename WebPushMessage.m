//
//  WebPushMessage.m
//  MMSHOW
//
//  Created by kennethwu on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WebPushMessage.h"

@implementation WebPushMessage
@synthesize msgType = _msgType;
@synthesize subscriberId = _subscriberId;
@synthesize message = _message;

- (id)initWithMsgType:(int)msgType
                SubId:(NSString*)subscriberId
              Message:(NSString*)message
{
    if ((self = [super init])) {
        self.msgType = msgType;
        self.subscriberId = subscriberId;
        self.message = message;
    }
    return self;
}

- (void) dealloc {
    self.subscriberId = nil;
    self.message = nil;    
    [super dealloc];
}

@end
