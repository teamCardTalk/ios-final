//
//  KHImageStore.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 29..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KHImageStore.h"

@implementation KHImageStore

- (instancetype) init {
    self = [super init];
    if (self) {
        dataCache = [[NSMutableDictionary alloc] init];
        communcators = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (NSData *)dataForURL:(NSURL *)url {
    if (url == nil) {
        return nil;
    }
    
    NSData *imageData = [dataCache objectForKey:[url absoluteString]];
    if (!imageData) {
        KHImageCommunicator *communicator = [[KHImageCommunicator alloc] init];
        [communcators setObject:communicator forKey:[url absoluteString]];
        communicator.delegate = self;
        [communicator fetchDataForURL:url];
    }
    return imageData;
}

- (void)didReceiveMemoryWarning:(NSNotificationCenter *)note {
    [dataCache removeAllObjects];
}

- (void)useNotificationCenter:(NSNotificationCenter *)center {
    [center addObserver: self selector: @selector(didReceiveMemoryWarning:) name:UIApplicationDidReceiveMemoryWarningNotification object: nil];
    notificationCenter = center;
}

- (void)stopUsingNotificationCenter:(NSNotificationCenter *)center {
    [center removeObserver:self];
    notificationCenter = nil;
}

- (void)communicatorGotErrorForURL:(NSURL *)url {
    [communcators removeObjectForKey:[url absoluteString]];
}

- (void)communicatorReceivedData:(NSData *)data forURL:(NSURL *)url {
    [dataCache setObject:data forKey:[url absoluteString]];
    [communcators removeObjectForKey:[url absoluteString]];
    NSNotification *note = [NSNotification notificationWithName:ImageStoreDidUpdateContentNotification object:self];
    [notificationCenter postNotification:note];
}

@end


NSString *ImageStoreDidUpdateContentNotification = @"ImageStoreDidUpdateContentNotification";