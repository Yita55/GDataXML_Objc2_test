//
//  SystemNotifyMessage.h
//  EphoneApiDemo
//
//  Created by kennethwu on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SystemNotifyMessage : NSObject {
    int _appId;
    int _sid;
    int _msgType;
    int _subscriberId;
    int _status;
    NSString *_content;
    NSString *_addTime;
    NSString *_nickName;
    int _dataSource;
    int _dataType;
}

@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *addTime;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, assign) int appId;
@property (nonatomic, assign) int sid;
@property (nonatomic, assign) int msgType;
@property (nonatomic, assign) int subscriberId;
@property (nonatomic, assign) int status;
@property (nonatomic, assign) int dataSource;
@property (nonatomic, assign) int dataType;

- (id)initWithAppId:(int)appId 
                Sid:(int)sid 
            MsgType:(int)msgType 
              SubId:(int)subId 
             Status:(int)status 
            Content:(NSString*)content 
            AddTime:(NSString*)addTime 
           NickName:(NSString*)nickName 
         DataSource:(int)dataSource 
           DataType:(int)dataType;

@end
