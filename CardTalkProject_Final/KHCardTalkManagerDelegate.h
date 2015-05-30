//
//  KHCardTalkManagerDelegate.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 29..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KHCardTalkManagerDelegate <NSObject>

- (void)fetchingCardsFailedWithError:(NSError *)error;
- (void)didReceiveCards:(NSArray *)cards;


@end
