//
//  MockKHCardTalkDataManagerDelegate.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 28..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHCardTalkDataManager.h"

@interface MockKHCardTalkDataManagerDelegate : NSObject<KHCardTalkManagerDelegate>

@property (strong, nonatomic) NSArray *cards;
@property (strong) NSString *name;
@property (strong) NSError *fetchError;

@end
