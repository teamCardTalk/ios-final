//
//  KHRealmTestRoomObject.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 29..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import "KHRealmTestChatModel.h"
#import "KHRealmTestUserModel.h"

@interface KHRealmTestRoomModel : RLMObject

@property NSString *articleid;
@property int numberOfParticipants;
@property RLMArray<KHRealmTestChatModel> *chatList;
@property RLMArray<KHRealmTestUserModel> *userList;
@property KHRealmTestUserModel *host;

@end
