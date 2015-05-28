//
//  KHRoomModel.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 27..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHBasicModel.h"
#import "KHChatModel.h"
#import "KHCardModel.h"

@interface KHRoomModel : KHBasicModel

@property (nonatomic, strong) KHCardModel *card;
@property (nonatomic, strong) NSMutableArray *chatList;
@property (nonatomic, strong) NSDate *lastChatDate;

- (instancetype)initWithCard:(KHCardModel*)card;
- (void)addChatToChatList:(KHChatModel *)chat;
- (NSArray *)recentChats;


@end
