//
//  KHCardTalkCommunicator.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 28..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHCardModel.h"
#import "KHCardTalkCommunicatorDelegate.h"

@interface KHCardTalkCommunicator : NSObject<NSURLConnectionDataDelegate> {
@protected
    NSURL *fetchingURL;
    NSURLConnection *fetchingConnection;
    NSMutableData *receivedData;
@private
    id <KHCardTalkCommunicatorDelegate> __weak delegate;
    void (^errorHandler)(NSError *);
    void (^successHandler)(NSString *);
}

@property (weak) id <KHCardTalkCommunicatorDelegate> delegate;


- (void)searchForRecentCards;
- (void)postCard:(NSDictionary *)cardDict;
- (void)postLogin:(NSDictionary *)userInfo;
- (void)postSignUp:(NSDictionary *)userInfo;
- (void)cancelAndDiscardURLConnection;
//- (void)downloadImageForCardWithFileList:(NSArray *)imageFileList;
//- (void)downloadIconImageWithIconName:(NSString *)iconName;
//- (void)fetchForImagesForCard:(KHCardModel *)card;
//- (void)fetchIconImage:(NSString *)iconName;

@end
extern NSString *KHCardTalkCommunicatorErrorDomain;