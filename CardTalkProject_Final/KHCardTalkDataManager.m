//
//  KHCardTalkDataManager.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 28..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHCardTalkDataManager.h"


extern NSString *CardTalkManagerError;
enum {
    CardTalkErrorCardSearchCode
};

@implementation KHCardTalkDataManager

//- (void) setDelegate:(id<KHCardTalkDataManagerDelegate>)delegate {
//    if (delegate && ![delegate conformsToProtocol:@protocol(KHCardTalkDataManagerDelegate)]) {
//        [[NSException exceptionWithName:NSInvalidArgumentException reason:@"Delegate object does not conform to the delegate protocol" userInfo:nil] raise];
//    }
//    self.delegate = delegate;
//}

- (void) fetchRecentCards {
    [self.communicator searchForRecentCardsBeforeDate:[[NSDate alloc] init]];
}

- (void) fetchImagesForCard:(KHCardModel*)card {
    [self.communicator fetchForImagesForCard:card];
}

- (void) searchingForCardsFailedWithError:(NSError *)error {
    [self tellDelegateAboutCardSearchError:error];
}

- (void) fetchingForImagesForCardFailedWithError:(NSError *)error {
    [self tellDelegateAboutCardSearchError:error];
}

- (void)receivedCardJSON:(NSString *)json {
    //json은 nil이 될 수 없음. 이전에 미리 에러 처리를 했기 떄문에.
    NSError *error = nil;
    NSArray *cards = [self.cardBuilder cardsFromJSON:json error:&error];
    //json 파싱이 안되면 nil반환, error메세지 담겨야함.
    if (!cards) {
        [self tellDelegateAboutCardSearchError:error];
    } else {
        [self.delegate didReceiveCards:cards];
    }
}

- (void)tellDelegateAboutCardSearchError:(NSError *)error {
    NSDictionary *errorInfo = nil;
    if (error) {
        errorInfo = [NSDictionary dictionaryWithObject:error forKey:NSUnderlyingErrorKey];
    }
    NSError *reportableError = [NSError errorWithDomain:CardTalkManagerError code:CardTalkErrorCardSearchCode userInfo:errorInfo];
    [self.delegate fetchingCardsFailedWithError:reportableError];
}

@end

NSString *CardTalkManagerError = @"CardTalkManagerError";