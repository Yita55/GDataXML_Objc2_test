//
//  vipConnectMsg.h
//  MMSHOW
//
//  Created by kennethwu on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface vipConnectMsg : NSObject {
    /*
     <XML><sid>1</sid><msgType>6</msgType><content><subscriberId>1000045</subscriberId><message>777777777777777777777777</message></content></XML>
     <XML><sid>1</sid><msgType>13</msgType><aparty>100035</aparty><bparty>77711000263</bparty></XML>
     */
    int _msgType;
    NSString *_aPartyId;
    NSString *_bPartyId;
}

@property (nonatomic, copy) NSString *aPartyId;
@property (nonatomic, copy) NSString *bPartyId;
@property (nonatomic, assign) int msgType;

- (id)initWithMsgType:(int)msgType
             aPartyId:(NSString*)aPartyId
             bPartyId:(NSString*)bPartyId;

@end
