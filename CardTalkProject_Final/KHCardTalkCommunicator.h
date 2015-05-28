//
//  KHCardTalkCommunicator.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 28..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHCardModel.h"

@interface KHCardTalkCommunicator : NSObject

- (void)searchForRecentCardsBeforeDate:(NSDate *)date;
- (void)fetchForImagesForCard:(KHCardModel *)card;

@end
