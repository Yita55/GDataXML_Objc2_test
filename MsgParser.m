//
//  MsgParser.m
//  EphoneApiDemo
//
//  Created by kennethwu on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MsgParser.h"
#import "SystemNotifyMessage.h"
#import "PushMessage.h"
#import "WebPushMessage.h"
#import "vipConnectMsg.h"
#import "GDataXMLNode.h"

@implementation MsgParser

/*
+ (NSString *)dataFilePath:(BOOL)forSave {
    // ??? don't release 
    // if "forSave" => write to disk
    // if don't save => write to mainBundle
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *documentsPath = [documentsDirectory stringByAppendingPathComponent:@"sysmessage.xml"];
    if (forSave || [[NSFileManager defaultManager] fileExistsAtPath:documentsPath]) {
        return documentsPath;
    } else {
        return [[NSBundle mainBundle] pathForResource:@"sysmessage" ofType:@"xml"];
    }
}
*/

+ (SystemNotifyMessage *)loadSystemNotifyMessage {
    //NSString *filePath = [self dataFilePath:FALSE];
    //NSLog(@"filePath=%@", filePath);
    //NSData *xmlData = [[NSMutableData alloc] initWithContentsOfFile:filePath];
    NSString *str = @"<XML><appID>2</appID><sid>1</sid><msgType>1</msgType><subscriberId>123456</subscriberId><status>1</status><nickName>test</nickName><content>How are you today? 中文</content><dataSource>0</dataSource><dataType>4</dataType></XML>";
    NSData *xmlData = [[NSData alloc] initWithData:[str dataUsingEncoding:NSUnicodeStringEncoding]];
    
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:&error];
    //NSLog(@"xmlData=%@!", xmlData);
    //NSLog(@"doc=%@!", doc);
    if (doc == nil) { return nil; }
    
    //Party *party = [[[Party alloc] init] autorelease];
    //SystemNotifyMessage *announcement = [[[SystemNotifyMessage alloc] init] autorelease];
    SystemNotifyMessage *announcement = nil;
    //NSArray *partyMembers = [doc.rootElement elementsForName:@"Player"];
    //NSArray *partyMembers = [doc nodesForXPath:@"//Party/Player" error:nil];
    NSArray *announceMembers = [doc nodesForXPath:@"//XML" error:nil];
    //for (GDataXMLElement *partyMember in partyMembers) {
    for (GDataXMLElement *announceMember in announceMembers) {
        //NSLog(@"!!!!");
        // Let's fill these in!
        int appId = -1;
        int sid = -1;
        int msgType = -1;
        int subscriberId = -1;
        int status = -1;
        NSString *content = @"nil";
        NSString *addTime = @"nil";
        NSString *nickName = @"nil";
        int dataSource = -1;
        int dataType = -1;
        
        // appId
        NSArray *appIds = [announceMember elementsForName:@"appID"];
        if (appIds.count > 0) {
            GDataXMLElement *firstAppId = (GDataXMLElement *) [appIds objectAtIndex:0];
            appId = firstAppId.stringValue.intValue;
        } 
        //else continue;
        
        // sid
        NSArray *sids = [announceMember elementsForName:@"sid"];
        if (sids.count > 0) {
            GDataXMLElement *firstSid = (GDataXMLElement *) [sids objectAtIndex:0];
            sid = firstSid.stringValue.intValue;
        } 
        //else continue;
        
        // msgType
        NSArray *msgTypes = [announceMember elementsForName:@"msgType"];
        if (msgTypes.count > 0) {
            GDataXMLElement *firstMsgType = (GDataXMLElement *) [msgTypes objectAtIndex:0];
            msgType = firstMsgType.stringValue.intValue;
        } 
        //else continue;
        
        // subscriberId
        NSArray *subscriberIds = [announceMember elementsForName:@"subscriberId"];
        if (subscriberIds.count > 0) {
            GDataXMLElement *firstSubscriberId = (GDataXMLElement *) [subscriberIds objectAtIndex:0];
            subscriberId = firstSubscriberId.stringValue.intValue;
        } 
        //else continue;
        
        // status
        NSArray *statuss = [announceMember elementsForName:@"status"];
        if (statuss.count > 0) {
            GDataXMLElement *firstStatus = (GDataXMLElement *) [statuss objectAtIndex:0];
            status = firstStatus.stringValue.intValue;
        } 
        //else continue;
        
        // content
        NSArray *contents = [announceMember elementsForName:@"content"];
        if (contents.count > 0) {
            GDataXMLElement *firstContent = (GDataXMLElement *) [contents objectAtIndex:0];
            content = firstContent.stringValue;
        } 
        //else continue;

        // addTime
        NSArray *addTimes = [announceMember elementsForName:@"addTime"];
        if (addTimes.count > 0) {
            GDataXMLElement *firstAddTime = (GDataXMLElement *) [addTimes objectAtIndex:0];
            addTime = firstAddTime.stringValue;
        }
        //else continue;
        
        // nickName
        NSArray *nickNames = [announceMember elementsForName:@"nickName"];
        if (nickNames.count > 0) {
            GDataXMLElement *firstNickName = (GDataXMLElement *) [nickNames objectAtIndex:0];
            nickName = firstNickName.stringValue;
        } 
        //else continue;
        
        // dataSource
        NSArray *dataSources = [announceMember elementsForName:@"dataSource"];
        if (dataSources.count > 0) {
            GDataXMLElement *firstDataSource = (GDataXMLElement *) [dataSources objectAtIndex:0];
            dataSource = firstDataSource.stringValue.intValue;
        } 
        //else continue;
        
        // dataType
        NSArray *dataTypes = [announceMember elementsForName:@"dataType"];
        if (dataTypes.count > 0) {
            GDataXMLElement *firstDataType = (GDataXMLElement *) [dataTypes objectAtIndex:0];
            dataType = firstDataType.stringValue.intValue;
        } 
        //else continue;
        
        //Player *player = [[[Player alloc] initWithName:name level:level rpgClass:rpgClass] autorelease];
        //[party.players addObject:player];
        
        //SystemNotifyMessage *announceMsg = [[[SystemNotifyMessage alloc] initWithAppId:appId Sid:sid MsgType:msgType SubId:subscriberId Status:status Content:content AddTime:addTime NickName:nickName DataSource:dataSource DataType:dataType] autorelease];
/*
        NSLog(@"%d", appId);
        NSLog(@"%d", sid);
        NSLog(@"%d", msgType);
        NSLog(@"%d", subscriberId);
        NSLog(@"%d", status);
        NSLog(@"%@", content);
        NSLog(@"%@", addTime);
        NSLog(@"%@", nickName);
        NSLog(@"%d", dataSource);
        NSLog(@"%d", dataType);
 */
        
        
        announcement = [[[SystemNotifyMessage alloc] initWithAppId:appId Sid:sid MsgType:msgType SubId:subscriberId Status:status Content:content AddTime:addTime NickName:nickName DataSource:dataSource DataType:dataType] autorelease];
    }
    
    [doc release];
    [xmlData release];
    //return part;
    return announcement;
}

+ (PushMessage *)loadPushMessage:(NSString*)xmlStr {
    /*
     NSString *str = @"<XML>
     <msgType>1</msgType>
     <push_content>kenneth.wu@linkyes.com.twkenneth.wu@linkyes.com.tw</push_content>
     <content>kenneth.wu@linkyes.com.twkenneth.wu@linkyes.com.tw</content>
     </XML>";
     */
    NSData *xmlData = [[NSData alloc] initWithData:[xmlStr dataUsingEncoding:NSUnicodeStringEncoding]];
    
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:&error];
    if (doc == nil) { return nil; }
    
    PushMessage *part = nil;
    NSArray *partMembers = [doc nodesForXPath:@"//XML" error:nil];
    for (GDataXMLElement *partMember in partMembers) {
        // Let's fill these in!
        int msgType = -1;
        NSString *push_content = @"nil";
        NSString *content = @"nil";
        
        //<msgType>1</msgType>
        //<push_content>kenneth.wu@linkyes.com.twkenneth.wu@linkyes.com.tw</push_content>
        //<content>kenneth.wu@linkyes.com.twkenneth.wu@linkyes.com.tw</content>
        
        // msgType
        NSArray *msgTypes = [partMember elementsForName:@"msgType"];
        if (msgTypes.count > 0) {
            GDataXMLElement *firstMsgType = (GDataXMLElement *) [msgTypes objectAtIndex:0];
            msgType = firstMsgType.stringValue.intValue;
        }
        //else continue;
        
        // content
        NSArray *pushContents = [partMember elementsForName:@"push_content"];
        if (pushContents.count > 0) {
            GDataXMLElement *firstPushContent = (GDataXMLElement *) [pushContents objectAtIndex:0];
            push_content = firstPushContent.stringValue;
        }
        //else continue;
        
        // content
        NSArray *contents = [partMember elementsForName:@"content"];
        if (contents.count > 0) {
            GDataXMLElement *firstContent = (GDataXMLElement *) [contents objectAtIndex:0];
            content = firstContent.stringValue;
        }
        //else continue;
        
        part = [[[PushMessage alloc] initWithMsgType:msgType PushContent:push_content Content:content] autorelease];
    }
    
    [doc release];
    [xmlData release];
    return part;
}

+ (WebPushMessage *)loadWebPushMessage:(NSString*)xmlStr
{
    NSData *xmlData = [[NSData alloc] initWithData:[xmlStr dataUsingEncoding:NSUnicodeStringEncoding]];
    
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:&error];
    if (doc == nil) { return nil; }
    
    WebPushMessage *part = nil;
    NSArray *partMembers = [doc nodesForXPath:@"//XML" error:nil];
    
    int msgType = -1;
    for (GDataXMLElement *partMember in partMembers) {
        // Let's fill these in!
        
        //NSString *subscriberId = @"nil";
        //NSString *message = @"nil";
        
        // msgType
        NSArray *msgTypes = [partMember elementsForName:@"msgType"];
        if (msgTypes.count > 0) {
            GDataXMLElement *firstMsgType = (GDataXMLElement *) [msgTypes objectAtIndex:0];
            msgType = firstMsgType.stringValue.intValue;
        }
        //else continue;
#if 0
        // subscriberId
        NSArray *subscriberIds = [partMember elementsForName:@"//content/subscriberId"];
        if (subscriberIds.count > 0) {
            GDataXMLElement *firstPushContent = (GDataXMLElement *) [subscriberIds objectAtIndex:0];
            subscriberId = firstPushContent.stringValue;
        }
        //else continue;
        
        // message
        NSArray *messages = [partMember elementsForName:@"//content/message"];
        if (messages.count > 0) {
            GDataXMLElement *firstContent = (GDataXMLElement *) [messages objectAtIndex:0];
            message = firstContent.stringValue;
        }
        //else continue;
        NSLog(@"SSS %d %@ %@", msgType, subscriberId, message);
        part = [[[WebPushMessage alloc] initWithMsgType:msgType SubId:subscriberId Message:message] autorelease];
#endif
    }
    
    NSString *subscriberId = @"nil";
    NSString *message = @"nil";
    NSArray *partMembers2 = [doc nodesForXPath:@"//XML/content" error:nil];
    for (GDataXMLElement *partMember in partMembers2) {

        
        
        // subscriberId
        NSArray *subscriberIds = [partMember elementsForName:@"subscriberId"];
        if (subscriberIds.count > 0) {
            GDataXMLElement *firstPushContent = (GDataXMLElement *) [subscriberIds objectAtIndex:0];
            subscriberId = firstPushContent.stringValue;
        }
        //else continue;
        
        // message
        NSArray *messages = [partMember elementsForName:@"message"];
        if (messages.count > 0) {
            GDataXMLElement *firstContent = (GDataXMLElement *) [messages objectAtIndex:0];
            message = firstContent.stringValue;
        }
        //else continue;
        //part = [[[WebPushMessage alloc] initWithMsgType:msgType SubId:subscriberId Message:message] autorelease];

    }
    
    //NSLog(@"SSS %d %@ %@", msgType, subscriberId, message);
    part = [[[WebPushMessage alloc] initWithMsgType:msgType SubId:subscriberId Message:message] autorelease];
    
    
    [doc release];
    [xmlData release];
    return part;
}

//====== 0818_2014, add
+ (vipConnectMsg *)loadvipConnectMsg:(NSString*)xmlStr
{
    NSData *xmlData = [[NSData alloc] initWithData:[xmlStr dataUsingEncoding:NSUnicodeStringEncoding]];
    
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:&error];
    if (doc == nil) { return nil; }
    
    vipConnectMsg *part = nil;
    NSArray *partMembers = [doc nodesForXPath:@"//XML" error:nil];
    
    int msgType = -1;
    for (GDataXMLElement *partMember in partMembers) {
        // msgType
        NSArray *msgTypes = [partMember elementsForName:@"msgType"];
        if (msgTypes.count > 0) {
            GDataXMLElement *firstMsgType = (GDataXMLElement *) [msgTypes objectAtIndex:0];
            msgType = firstMsgType.stringValue.intValue;
        }
    }
    
    NSString *aPartyId = @"nil";
    NSString *bPartyId = @"nil";
    NSArray *partMembers2 = [doc nodesForXPath:@"//XML/content" error:nil];
    for (GDataXMLElement *partMember in partMembers2) {
        // aparty
        NSArray *subscriberIds = [partMember elementsForName:@"aparty"];
        if (subscriberIds.count > 0) {
            GDataXMLElement *firstPushContent = (GDataXMLElement *) [subscriberIds objectAtIndex:0];
            aPartyId = firstPushContent.stringValue;
        }
        //else continue;
        
        // bparty
        NSArray *messages = [partMember elementsForName:@"bparty"];
        if (messages.count > 0) {
            GDataXMLElement *firstContent = (GDataXMLElement *) [messages objectAtIndex:0];
            bPartyId = firstContent.stringValue;
        }
        //else continue;
        //part = [[[WebPushMessage alloc] initWithMsgType:msgType SubId:subscriberId Message:message] autorelease];
        
    }
    
    part = [[[vipConnectMsg alloc] initWithMsgType:msgType aPartyId:aPartyId bPartyId:bPartyId] autorelease];
    
    [doc release];
    [xmlData release];
    return part;
}

/*
+ (void)saveSystemNotifyMessage:(SystemNotifyMessage *)SystemNotifyMessage {
    GDataXMLElement * partyElement = [GDataXMLNode elementWithName:@"Party"];
    
    for(Player *player in party.players) {
        
        GDataXMLElement * playerElement = [GDataXMLNode elementWithName:@"Player"];
        GDataXMLElement * nameElement = [GDataXMLNode elementWithName:@"Name" stringValue:player.name];
        GDataXMLElement * levelElement = [GDataXMLNode elementWithName:@"Level" stringValue:[NSString stringWithFormat:@"%d", player.level]];
        NSString *classString;
        if (player.rpgClass == RPGClassFighter) {
            classString = @"Fighter";
        } else if (player.rpgClass == RPGClassRogue) {
            classString = @"Rogue";
        } else if (player.rpgClass == RPGClassWizard) {
            classString = @"Wizard";
        }        
        GDataXMLElement * classElement = [GDataXMLNode elementWithName:@"Class" stringValue:classString];
        
        [playerElement addChild:nameElement];
        [playerElement addChild:levelElement];
        [playerElement addChild:classElement];
        [partyElement addChild:playerElement];
    }
    
    GDataXMLDocument *document = [[[GDataXMLDocument alloc] initWithRootElement:partyElement] autorelease];
    NSData *xmlData = document.XMLData;
    
    NSString *filePath = [self dataFilePath:TRUE];
    NSLog(@"Saving xml data to %@...", filePath);
    [xmlData writeToFile:filePath atomically:YES];
}
 */

@end
