//
//  KHRealmTestChatModel.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 29..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import "KHRealmTestUserModel.h"

@interface KHRealmTestChatModel : RLMObject

@property KHRealmTestUserModel *user;
@property NSString *content;
@property NSDate *time;
@property NSString *articleid;

@end
RLM_ARRAY_TYPE(KHRealmTestChatModel)
