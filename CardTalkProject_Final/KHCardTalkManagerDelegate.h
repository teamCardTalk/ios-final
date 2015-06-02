//
//  KHCardTalkManagerDelegate.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 29..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHChatModel.h"
#import "KHCardModel.h"
#import "KHRealmCardModel.h"

@class RLMResults;

@protocol KHCardTalkManagerDelegate <NSObject>

@optional
- (void)fetchingCardsFailedWithError:(NSError *)error;
- (void)didReceiveCards:(NSArray *)cards;
- (void)didReceiveCardsFromRealm:(NSArray *)cards;
- (void)didPostCard;
- (void)didReceiveChats:(NSArray *)chats;
- (void)didReceiveOneCard:(KHRealmCardModel *)card;
- (void)didReceiveOneChat:(KHChatModel *)chat;
- (void)didReceiveChatsFromRealm:(RLMResults *)chats;


@end
