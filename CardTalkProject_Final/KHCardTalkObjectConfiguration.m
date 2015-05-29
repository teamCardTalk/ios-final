//
//  KHCardTalkObjectConfiguration.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 29..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHCardTalkObjectConfiguration.h"
#import "KHCardTalkCommunicator.h"
#import "KHCardTalkDataManager.h"
#import "KHImageStore.h"
#import "KHRoomStore.h"

@implementation KHCardTalkObjectConfiguration

- (KHCardTalkDataManager *) kHCardTlakDatamanager {
    KHCardTalkDataManager *manager = [[KHCardTalkDataManager alloc] init];
    manager.communicator = [[KHCardTalkCommunicator alloc] init];
    manager.communicator.delegate = manager;
    manager.cardBuilder = [[KHCardBuilder alloc] init];
    return manager;
}

- (KHImageStore *) imageStore {
    static KHImageStore *imageStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        imageStore = [[KHImageStore alloc] init];
        [imageStore useNotificationCenter:[NSNotificationCenter defaultCenter]];
    });
    return imageStore;
}

- (KHRoomStore *) roomStore {
    static KHRoomStore *roomStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        roomStore = [[KHRoomStore alloc] init];
        [roomStore useNotificationCenter:[NSNotificationCenter defaultCenter]];
    });
    return roomStore;
}

@end
