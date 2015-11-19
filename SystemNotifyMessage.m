//
//  SystemNotifyMessage.m
//  EphoneApiDemo
//
//  Created by kennethwu on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SystemNotifyMessage.h"

@implementation SystemNotifyMessage
@synthesize appId = _appId;
@synthesize sid = _sid;
@synthesize msgType = _msgType;
@synthesize subscriberId = _subscriberId;
@synthesize status = _status;
@synthesize content = _content;
@synthesize addTime = _addTime;
@synthesize nickName = _nickName;
@synthesize dataSource = _dataSource;
@synthesize dataType = _dataType;

- (id)initWithAppId:(int)appId 
                Sid:(int)sid 
            MsgType:(int)msgType 
              SubId:(int)subId 
             Status:(int)status 
            Content:(NSString*)content 
            AddTime:(NSString*)addTime 
           NickName:(NSString*)nickName 
         DataSource:(int)dataSource 
           DataType:(int)dataType 
{
    if ((self = [super init])) {
        self.appId = appId;
        self.sid = sid;
        self.msgType = msgType;
        self.subscriberId = subId;
        self.status = status;
        self.content = content;
        self.addTime = addTime;
        self.nickName = nickName;
        self.dataSource = dataSource;
        self.dataType = dataType;
    }    
    return self;
}

- (void) dealloc {
    self.content = nil;    
    self.addTime = nil;
    self.nickName = nil;
    [super dealloc];
}

@end
