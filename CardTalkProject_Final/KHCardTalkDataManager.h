//
//  KHCardTalkDataManager.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 28..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHBasicModel.h"
#import "KHCardTalkCommunicator.h"
#import "KHCardBuilder.h"
#import "KHCardModel.h"

@protocol KHCardTalkDataManagerDelegate <NSObject>

- (NSArray *)receivedCards;
- (void)fetchingCardsFailedWithError:(NSError *)error;
- (void)didReceiveCards:(NSArray *)cards;

@end


@interface KHCardTalkDataManager : KHBasicModel

@property (nonatomic, weak) id<KHCardTalkDataManagerDelegate> delegate;
@property (strong) KHCardTalkCommunicator *communicator;
@property (nonatomic, strong) KHCardBuilder *cardBuilder;


- (void) fetchRecentCards;
- (void) fetchImagesForCard:(KHCardModel*)card;
- (void) searchingForCardsFailedWithError:(NSError*)error;
- (void) fetchingForImagesForCardFailedWithError:(NSError *)error;
- (void) receivedCardJSON:(NSString *)json;

@end
