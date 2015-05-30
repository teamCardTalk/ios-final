//
//  CardCreattionTests.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 28..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "KHCardTalkDataManager.h"
#import "MockKHCardTalkDataManagerDelegate.h"
#import "MockKHCardTalkCommunicator.h"
#import "KHCardModel.h"
#import "FakeKHCardBuilder.h"

@interface CardCreationWorkFlowTests : XCTestCase

@end

extern NSString *CardTalkManagerError;

@implementation CardCreationWorkFlowTests {
@private
    KHCardTalkDataManager *mgr;
    NSString *cardJsonString;
    MockKHCardTalkDataManagerDelegate *delegate;
    NSError *underlyngError;
    NSArray *cardArray;
    
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    mgr = [[KHCardTalkDataManager alloc] init];
    delegate = [[MockKHCardTalkDataManagerDelegate alloc] init];
    mgr.delegate = delegate;
    underlyngError = [NSError errorWithDomain:@"Test Domain" code:0 userInfo:nil];
    cardJsonString = @"{    \"status\" : \"1\",    \"partynumber\" : \"1\",    \"content\" : \"고양이는 귀엽습니다. 그렇습니다.\",    \"createtime\" : \"15-05-24 19:07\",    \"title\" : \"녹색 여왕의 알콩달콩한 다락방\",    \"_id\" : \"5561a2c76800d5774f77d5e0\",    \"file\" : [         {            \"path\" : \"../data/upload_32295249878886ab59f1a3bec635b9c1.JPG\",            \"name\" : \"cat01.JPG\",            \"_id\" : \"5561a2c76800d5774f77d5e1\"        }    ],    \"author\" : {        \"userid\" : \"user02\",        \"nickname\" : \"노란 광대\",        \"icon\" : \"icon/icon2.png\"    },    \"__v\" : 0}";
    KHCardModel *card = [[KHCardModel alloc] initWithJsonString:cardJsonString];
    cardArray = [NSArray arrayWithObject:card];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    mgr = nil;
    cardJsonString = nil;
    delegate = nil;
    underlyngError = nil;
    cardArray = nil;
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

//- (void)testNonConformingObjectCannotBeDelegate {
//    XCTAssertThrows(mgr.delegate = (id <KHCardTalkDataManagerDelegate>) [NSNull null], @"NSNull should not be used as the delegates as doesn't conform to the delegate protogcol");
//}

- (void) testConformingObjectCanBeDelegate {
    id <KHCardTalkManagerDelegate> delegate = [[MockKHCardTalkDataManagerDelegate alloc] init];
    XCTAssertNoThrow(mgr.delegate = delegate, @"Object conforming to the delegate protocol should be used as the delegate");
}

- (void) testAskingForCardsMeansRequestingData {
    MockKHCardTalkCommunicator *communicator = [[MockKHCardTalkCommunicator alloc] init];
    mgr.communicator = communicator;
//    [mgr fetchRecentCards];
    XCTAssertTrue([communicator wasAskedToFetchCards], @"The communicator should need to fetch data.");
}

- (void)testErrorReturnedToDelegateIsNotErrorNotifiedByCommunicator {

    NSError *underlyingError = [NSError errorWithDomain:@"Test domain" code:0 userInfo:nil];
    [mgr searchingForCardsFailedWithError:underlyingError];
    
    //searching For Card Fail 이 어떤식으로 발생하는가? communicator에서 발생한 에러가 manager로 전달, manager는 이 에러를 포장해서 delegate에 전달.
    
    XCTAssertFalse(underlyingError == [delegate fetchError], @"Error should be at the correct level of abstraction");
}

- (void) testErrorReturnedToDelegateDocumentsUnderlyingError {

        NSError *underlyingError = [NSError errorWithDomain:@"Test domain" code:0 userInfo:nil];
    [mgr searchingForCardsFailedWithError:underlyingError];
    XCTAssertEqualObjects([[[delegate fetchError] userInfo] objectForKey: NSUnderlyingErrorKey], underlyingError, @"The underlying error should be available to client code");
}

- (void) testCardJSONIsPassedToCardBuilder {
    FakeKHCardBuilder *builder = [[FakeKHCardBuilder alloc] init];
    mgr.cardBuilder = builder;
    [mgr receivedCardJSON: @"FAKE JSON"];
    XCTAssertEqualObjects(builder.JSON, @"FAKE JSON",
                          @"Downloaded JSON is sent to the builder");
    mgr.cardBuilder = nil;
}

- (void) testDelegateNotifiedOfErrorWhenCardBuilderFails {
    FakeKHCardBuilder *builder = [[FakeKHCardBuilder alloc] init];
    builder.arrayToReturn = nil;
    builder.errorToSet = underlyngError;
    mgr.cardBuilder = builder;
    [mgr receivedCardJSON:@"Fake Json"];
    XCTAssertNotNil([[[delegate fetchError] userInfo] objectForKey:NSUnderlyingErrorKey], @"The delegate should have found out the error");
}

- (void) testDelegateNotToldAboutErrorWhenCardReceived {
    FakeKHCardBuilder *builder = [[FakeKHCardBuilder alloc] init];
    mgr.cardBuilder = builder;
    builder.arrayToReturn = cardArray;
    [mgr receivedCardJSON:@"Fake Json"];
    XCTAssertNil(delegate.fetchError, @"No error should be received on success");
}

//- (void) testDelegateReceivesCardsDiscoveredByManager {
//    FakeKHCardBuilder *builder = [[FakeKHCardBuilder alloc] init];
//    mgr.cardBuilder = builder;
//    builder.arrayToReturn = cardArray;
//    [mgr receivedCardJSON:@"Fake Json"];
//    XCTAssertEqualObjects([delegate receivedCards], cardArray, @"The manager should have sent its cards to the delegate");
//}







@end
