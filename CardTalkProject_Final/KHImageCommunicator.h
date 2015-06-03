//
//  KHImageCommunicator.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 29..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KHImageCommunicatorDelegate.h"

@interface KHImageCommunicator : NSObject <NSURLConnectionDataDelegate>

@property (retain) NSURL *url;
@property (retain) NSMutableData *receivedData;
@property (assign) id <KHImageCommunicatorDelegate> delegate;
@property (assign) NSURLConnection *connection;

- (void)fetchDataForURL: (NSURL *)location;

@end
