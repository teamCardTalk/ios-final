//
//  KHCardTalkCommunicatorDelegate.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 29..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol KHCardTalkCommunicatorDelegate <NSObject>

- (void) searchingForCardsFailedWithError:(NSError*)error;
- (void) postingForCardsFaildWithError:(NSError *)error;
- (void) postingForLoginFaildWithError:(NSError *)error;
- (void) postingForSignUpFaildWithError:(NSError *)error;
- (void) receivedCardJSON:(NSString *)json;
- (void) finishPostCard:(NSString *)response;
- (void) finishPostLogin:(NSString *)response;
- (void) finishPostSignUp:(NSString *)response;


@end
