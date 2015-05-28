//
//  MockKHCardTalkDataManagerDelegate.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 28..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "MockKHCardTalkDataManagerDelegate.h"

@implementation MockKHCardTalkDataManagerDelegate

- (void)fetchingCardsFailedWithError:(NSError *)error {
    self.fetchError = error;
}

- (NSArray *)receivedCards {
    return self.cards;
}

- (void)didReceiveCards:(NSArray *)cards {
    self.cards = cards;
}

@end
