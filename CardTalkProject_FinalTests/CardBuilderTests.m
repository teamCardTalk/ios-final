//
//  CardBuilderTests.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 29..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "KHCardBuilder.h"
#import "KHCardModel.h"
#import "MockKHCardTalkCommunicator.h"
#import "KHCardTalkDataManager.h"
#import "MockKHCardTalkDataManagerDelegate.h"

@interface CardBuilderTests : XCTestCase {
    KHCardBuilder *cardBuilder;
    KHCardModel *cardToFetch;
    NSArray *cardList;
    MockKHCardTalkCommunicator *communicator;
    KHCardTalkDataManager *mgr;
    MockKHCardTalkDataManagerDelegate *delegate;
}

@end

@implementation CardBuilderTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    cardBuilder = [[KHCardBuilder alloc] init];
    cardToFetch = [[KHCardModel alloc] init];
    cardToFetch.articleID = @"1234";
    cardList = [NSArray arrayWithObject:cardToFetch];
    communicator = [[MockKHCardTalkCommunicator alloc] init];
    delegate = [[MockKHCardTalkDataManagerDelegate alloc] init];
    mgr = [[KHCardTalkDataManager alloc] init];
    mgr.communicator = communicator;
    mgr.delegate = delegate;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    cardBuilder = nil;
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testThatNilIsNotAcceptableParameter {
    XCTAssertThrows([cardBuilder cardsFromJSON:nil error:NULL], @"Lack of data shuld have been handled elsewhere");
}

- (void)testNilReturnedWhenStringIsNotJson {
    XCTAssertNil([cardBuilder cardsFromJSON:@"not json" error:NULL], @"this parameter should not be parsable");
}

- (void)testErrorSetWhenStringIsNotJson {
    NSError *error = nil;
    [cardBuilder cardsFromJSON:@"not json" error:&error];
    XCTAssertNotNil(error, @"An error occured, we should be told");
}

- (void)testBuilderReturnProperCardArrayList {
    NSString *jsonString = @"[  {    \"status\": \"1\",    \"partynumber\": \"1\",    \"content\": \"고양이는 귀엽습니다. 그렇습니다.\",    \"createtime\": \"15-05-24 19:07\",    \"title\": \"녹색 여왕의 알콩달콩한 다락방\",    \"_id\": \"5561a2c76800d5774f77d5e0\",    \"__v\": 0,    \"file\": [      {        \"path\": \"../data/upload_32295249878886ab59f1a3bec635b9c1.JPG\",        \"name\": \"cat01.JPG\",        \"_id\": \"5561a2c76800d5774f77d5e1\"      }    ],    \"author\": {      \"userid\": \"user02\",      \"nickname\": \"노란 광대\",      \"icon\": \"icon/icon2.png\"    }  },  {    \"status\": \"1\",    \"partynumber\": \"1\",    \"content\": \"내용을 입력하세요...\",    \"createtime\": \"15-05-25 16:04\",    \"title\": \"노란 조커의 은밀한 노래방\",    \"_id\": \"5562c98a8509aeb87c17d7e0\",    \"__v\": 0,    \"file\": [      {        \"path\": \"../data/upload_0b5b15f650a034b993fd2e09f0e1df53.png\",        \"name\": \"stake.png\",        \"_id\": \"5562c98a8509aeb87c17d7e1\"      }    ],    \"author\": {      \"userid\": \"user02\",      \"nickname\": \"노란 광대\",      \"icon\": \"icon/icon2.png\"    }  },  {    \"status\": \"1\",    \"partynumber\": \"10\",    \"content\": \"버그 잡아주세요, 네?!\",    \"createtime\": \"15-05-26 15:42\",    \"title\": \"분홍 마법사의 초롱초롱한 눈망울\",    \"_id\": \"556415f036d0c68d41411bb8\",    \"__v\": 0,    \"file\": [      {        \"path\": \"../data/upload_2af70cd6e09341f49ad15a96ce07d9d4.jpg\",        \"name\": \"cat02.jpg\",        \"_id\": \"556415f036d0c68d41411bb9\"      }    ],    \"author\": {      \"userid\": \"user03\",      \"nickname\": \"노란 광대\",      \"icon\": \"icon/icon2.png\"    }  },  {    \"status\": \"1\",    \"partynumber\": \"1\",    \"content\": \"날씨가 덥네요.\",    \"createtime\": \"15-05-28 14:42\",    \"title\": \"노란 조커의 뒤죽박죽한 책상\",    \"_id\": \"5566aae2791705946172478b\",    \"__v\": 0,    \"file\": [      {        \"path\": \"../data/upload_e7eee6f925f40bba2559d5a9d337ac77.jpg\",        \"name\": \"cat03.jpg\",        \"_id\": \"5566aae2791705946172478c\"      }    ],    \"author\": {      \"userid\": \"user03\",      \"nickname\": \"노란 광대\",      \"icon\": \"icon/icon2.png\"    }  }]";
    NSArray *cards = [cardBuilder cardsFromJSON:jsonString error:nil];
    for (id card in cards) {
        XCTAssertTrue([card isKindOfClass:[KHCardModel class]]);
    }
    XCTAssertEqual(cards.count, 4);
}

- (void)testBuilderReturnVacantCardList {
    NSString *jsonString = @"[]";
    NSArray *cards = [cardBuilder cardsFromJSON:jsonString error:nil];
    XCTAssertEqual(cards.count, 0);
}

//- (void)testAskingForCardImageMeansRequestingData {
//    [mgr fetchImagesForCard:cardToFetch];
//    XCTAssertTrue([communicator wasAskedToFetchImagesForCard]);
//}
//
//- (void)testDelegateNotifiedOfFailureToFetchImages {
//    NSError *error = [NSError errorWithDomain:@"Test Domain" code:0 userInfo:nil];
//    [mgr fetchingForImagesForCardFailedWithError:error];
//    XCTAssertNotNil([[[delegate fetchError] userInfo] objectForKey:NSUnderlyingErrorKey]);
//}

- (void)testManagerPassesRetrievedCardImagesToCardBuilder {
    
}
























@end
