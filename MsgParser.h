//
//  MsgParser.h
//  EphoneApiDemo
//
//  Created by kennethwu on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SystemNotifyMessage;
@class PushMessage;
//====== 0717_2014, add
@class WebPushMessage;
//====== 0818_2014, add
@class vipConnectMsg;

@interface MsgParser : NSObject {
    
}

+ (SystemNotifyMessage *)loadSystemNotifyMessage;
+ (PushMessage *)loadPushMessage:(NSString*)xmlStr;
//+ (void)saveSystemNotifyMessage:(SystemNotifyMessage *)SystemNotifyMessage;
+ (WebPushMessage *)loadWebPushMessage:(NSString*)xmlStr;
//====== 0818_2014, add
+ (vipConnectMsg *)loadvipConnectMsg:(NSString*)xmlStr;

@end
