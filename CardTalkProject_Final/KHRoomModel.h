//
//  KHRoomModel.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 27..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//
#import "KHCardModel.h"
#import <Realm/Realm.h>
#import "KHChatModel.h"
#import "KHUserModel.h"


@interface KHRoomModel : RLMObject

@property NSString *articleid;
@property int numberOfParticipants;
@property RLMArray<KHUserModel> *userList;
@property RLMArray<KHChatModel> *chatList;
@property NSDate *lastChatDate;
@property int numberOfRecentChat;
@property int readIndex;

//- (instancetype)initWithCard:(KHCardModel *)card;
- (void)addChatToChatList:(KHChatModel *)chat;

@end
RLM_ARRAY_TYPE(KHRoomModel)
