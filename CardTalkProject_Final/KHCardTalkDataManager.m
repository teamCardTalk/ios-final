//
//  KHCardTalkDataManager.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 28..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHCardTalkDataManager.h"




@implementation KHCardTalkDataManager

//- (void) setDelegate:(id<KHCardTalkDataManagerDelegate>)delegate {
//    if (delegate && ![delegate conformsToProtocol:@protocol(KHCardTalkDataManagerDelegate)]) {
//        [[NSException exceptionWithName:NSInvalidArgumentException reason:@"Delegate object does not conform to the delegate protocol" userInfo:nil] raise];
//    }
//    self.delegate = delegate;
//}

- (void) fetchCards {
    [self.communicator searchForRecentCards];
}

- (void) postCard:(NSDictionary *)contentDict {
    [self.communicator postCard:contentDict];
}

- (void) postLogin:(NSDictionary *)userInfo {
    [self.communicator postLogin:userInfo];
    
}

- (void) postSignUp:(NSDictionary *)userInfo {
    [self.communicator postSignUp:userInfo];
}

- (void) searchingForCardsFailedWithError:(NSError *)error {
    [self tellDelegateAboutCardSearchError:error];
}

- (void) postingForCardsFaildWithError:(NSError *)error {
    [self tellDelegateAboutCardSearchError:error];
}

- (void) postingForLoginFaildWithError:(NSError *)error {
    [self tellDelegateAboutCardSearchError:error];
}

- (void) postingForSignUpFaildWithError:(NSError *)error {
    [self tellDelegateAboutCardSearchError:error];
    //나중에 에러 수정.
}

- (void) finishPostCard:(NSString *)response {
    
}

- (void) finishPostLogin:(NSString *)response {
    if ([self loginFailedMessage:response]) {
        return;
    }
    
}

- (void) finishPostSignUp:(NSString *)response {
    
}

- (void)receivedCardJSON:(NSString *)json {
    //json은 nil이 될 수 없음. 이전에 미리 에러 처리를 했기 떄문에.
    NSError *error = nil;
    
    NSLog(@"received CardJson %@", json);
    if ([self loginFailedMessage:json]) {
        return;
    }
    
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
    
    NSError *reportableError = [NSError errorWithDomain:CardTalkManagerError code:CardTalkManagerErrorCardSearchCode userInfo:errorInfo];
    [self.delegate fetchingCardsFailedWithError:reportableError];
}

- (id)convertJSONToDict:(NSString *)json {
    NSError *error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&error];
    return result;
}

- (BOOL)loginFailedMessage:(NSString *)response {
    NSLog(@"delegate에 레스폰스 전달 %@", response);
    id resp = [self convertJSONToDict:response];
    if ([resp isKindOfClass:[NSArray class]])
        return NO;
    resp = (NSDictionary *)resp;
    if ([resp[@"error"] isEqualToNumber:@1]) {
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc postNotificationName:@"login fail" object:nil];
        NSLog(@"login fail");
        return YES;
    }
    return NO;
}

@end

NSString *CardTalkManagerError = @"CardTalkManagerError";