//
//  PushMessage.h
//  EphoneApiDemo
//
//  Created by kennethwu on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PushMessage : NSObject {
    int _msgType;
    NSString *_push_content;
    NSString *_content;
}

@property (nonatomic, copy) NSString *push_content;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign) int msgType;

- (id)initWithMsgType:(int)msgType
          PushContent:(NSString*)push_content
              Content:(NSString*)content;

@end
