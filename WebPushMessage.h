//
//  WebPushMessage.h
//  MMSHOW
//
//  Created by kennethwu on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebPushMessage : NSObject {
    /*
     <XML><sid>1</sid><msgType>6</msgType><content><subscriberId>1000045</subscriberId><message>777777777777777777777777</message></content></XML>
     */
    int _msgType;
    NSString *_subscriberId;
    NSString *_message;
}

@property (nonatomic, copy) NSString *subscriberId;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, assign) int msgType;

- (id)initWithMsgType:(int)msgType
                SubId:(NSString*)subscriberId
              Message:(NSString*)message;

@end
