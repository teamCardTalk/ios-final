//
//  MockKHCardTalkCommunicator.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 28..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHCardTalkCommunicator.h"

@interface MockKHCardTalkCommunicator : KHCardTalkCommunicator

- (BOOL)wasAskedToFetchCards;
- (BOOL)wasAskedToFetchImagesForCard;
- (BOOL)wasAskedToFetchIconImage;

@end
