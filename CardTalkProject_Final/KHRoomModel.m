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
        _articleid = card.articleID;
        _numberOfParticipants = card.partynumber;
        _numberOfParticipants = 0;
    }
    return self;
}

- (void)addChatToChatList:(KHChatModel *)chat {
    [self.chatList addObject:chat];
}

- (void)addUserToUserList:(KHUserModel *)user {
    [self.userList addObject:user];
}

- (void)removeUserFromUserList:(NSString *)userid {
    for (int i = 0; i < self.userList.count; i++) {
        KHUserModel *user = self.userList[i];
        if (user.userid == userid) {
            [self.userList removeObjectAtIndex:i];
            break;
        }
    }
}

- (NSArray *)fetchingChatListAfterReadIndex:(int)readIndex {
    NSUInteger count = (readIndex + 20 > self.chatList.count) ? self.chatList.count : readIndex + 20;
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (int i = 0; i < count; i++) {
        [result addObject:self.userList[i]];
    }
    self.readIndex = (int)count;
    return [NSArray arrayWithArray:result];
}

- (NSArray *)fetchingRecentChatList {
    int count = (20 > self.chatList.count) ? (int)self.chatList.count : 20;
    self.readIndex = count;
    return [self fetchingChatListAfterReadIndex:0];
}

- (RLMArray *)fetchingUserList {
    return self.userList;
}



//- (NSArray *)recentChats {
//    NSArray *result = [self.chatList sortedArrayUsingComparator:^(id obj1, id obj2) {
//        KHChatModel *chat1 = (KHChatModel *)obj1;
//        KHChatModel *chat2 = (KHChatModel *)obj2;
//        return [chat1.date compare:chat2.date];
//    }];
//    _lastChatDate = [(KHChatModel*)[result firstObject] date];
//    return result;
//    
//    //Realm 이랑 이어서 예전 대화 데이터 가져오기. 최근 20개씩 계속.
//}

@end
