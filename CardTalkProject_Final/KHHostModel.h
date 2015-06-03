//
//  KHHostModel.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 31..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "RLMObject.h"
#import <Realm/Realm.h>
#import "KHRoomModel.h"
#import "KHUserModel.h"


@interface KHHostModel : RLMObject

@property NSString *userid;
@property NSString *nickname;
@property NSString *cookie;
@property NSString *deviceType;
@property NSString *uid;
@property NSString *icon;
@property RLMArray<KHRoomModel> *roomList;
@property RLMArray<KHUserModel> *friends;
@property RLMArray<KHChatModel> *chatList;

-(instancetype)initWithUserInfo:(NSDictionary *)userInfo;
-(void)saveHost;

@end
