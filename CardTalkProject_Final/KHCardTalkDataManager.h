//
//  KHCardTalkDataManager.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 28..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHBasicModel.h"
#import "KHCardTalkCommunicator.h"
#import "KHCardBuilder.h"
#import "KHCardModel.h"
#import "KHChatBuilder.h"
#import "KHCardTalkCommunicatorDelegate.h"
#import "KHCardTalkManagerDelegate.h"
#import "KHHostModel.h"
#import "KHRealmCommunicator.h"
#import <Realm/Realm.h>
#import "KHRealmCardModel.h"
#import "KHChatModel.h"

@interface KHCardTalkDataManager : NSObject <KHCardTalkCommunicatorDelegate>

@property (nonatomic, weak) id<KHCardTalkManagerDelegate> delegate;
@property (strong) KHCardTalkCommunicator *communicator;
@property (strong) KHCardBuilder *cardBuilder;
@property (strong) KHChatBuilder *chatBuilder;
@property (strong) KHCardModel *cardToFill;
@property (strong) KHCardModel *cardNeedingImage;

- (void) fetchCards;
- (void) fetchCardsFromPrivateRealm;
- (void) fetchChatsFromPrivateRealmAtCard:(NSString *)ariticleid;
- (void) fetchChatsAtCard:(NSString *)articleid;
- (void) postCard:(NSDictionary *)contentDict;
- (void) postLogin:(NSDictionary *)userInfo;
- (void) postSignUp:(NSDictionary *)userInfo;

@end

extern NSString *CardTalkManagerError;
enum {
    CardTalkManagerErrorCardSearchCode,
    CardTalkManagerErrorCardImagesFetchCode,
    CardTalkManagerErrorChatsFetchCode
};
