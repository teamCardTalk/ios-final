//
//  KHRealmCommunicator.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 6. 2..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import "KHCardTalkCommunicatorDelegate.h"

@interface KHRealmCommunicator : NSObject

@property (assign) id <KHCardTalkCommunicatorDelegate> delegate;

- (void)searchForCardsFromRealm;

@end
