//
//  KHImageStore.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 29..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHImageCommunicatorDelegate.h"
#import "KHImageCommunicator.h"

@interface KHImageStore : NSObject <KHImageCommunicatorDelegate> {
    NSMutableDictionary *dataCache;
    NSMutableDictionary *communcators;
    NSNotificationCenter *notificationCenter;
}

- (NSData *)dataForURL: (NSURL *)url;
- (void)didReceiveMemoryWarning:(NSNotificationCenter *)note;
- (void)useNotificationCenter: (NSNotificationCenter *)center;
- (void)stopUsingNotificationCenter: (NSNotificationCenter *)center;

@end

extern NSString *ImageStoreDidUpdateContentNotification;