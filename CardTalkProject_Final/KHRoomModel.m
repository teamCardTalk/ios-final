//
//  KHRoomModel.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 27..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHRoomModel.h"

@implementation KHRoomModel

-(instancetype)initWithCard:(KHCardModel *)card {
    self = [super init];
    if (self) {
        _card = card;
        _chatList = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addChatToChatList:(KHChatModel *)chat {
    [self.chatList addObject:chat];
}

- (NSArray *)recentChats {
    NSArray *result = [self.chatList sortedArrayUsingComparator:^(id obj1, id obj2) {
        KHChatModel *chat1 = (KHChatModel *)obj1;
        KHChatModel *chat2 = (KHChatModel *)obj2;
        return [chat1.date compare:chat2.date];
    }];
    _lastChatDate = [(KHChatModel*)[result firstObject] date];
    return result;
    
    //Realm 이랑 이어서 예전 대화 데이터 가져오기. 최근 20개씩 계속.
}

@end
