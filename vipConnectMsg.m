//
//  vipConnectMsg.m
//  MMSHOW
//
//  Created by kennethwu on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "vipConnectMsg.h"

@implementation vipConnectMsg
@synthesize msgType = _msgType;
@synthesize aPartyId = _aPartyId;
@synthesize bPartyId = _bPartyId;

- (id)initWithMsgType:(int)msgType
             aPartyId:(NSString*)aPartyId
             bPartyId:(NSString*)bPartyId
{
    if ((self = [super init])) {
        self.msgType = msgType;
        self.aPartyId = aPartyId;
        self.bPartyId = bPartyId;
    }
    return self;
}

- (void) dealloc {
    self.aPartyId = nil;
    self.bPartyId = nil;    
    [super dealloc];
}

@end
