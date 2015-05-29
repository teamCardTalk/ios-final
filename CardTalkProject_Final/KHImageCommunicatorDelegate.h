//
//  KHImageCommunicatorDelegate.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 29..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KHImageCommunicatorDelegate <NSObject>

- (void)communicatorReceivedData: (NSData *)data forURL: (NSURL *) url;
- (void)communicatorGotErrorForURL: (NSURL *)url;

@end
