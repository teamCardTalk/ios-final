//
//  ChatModelTests.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 27..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "KHChatModel.h"

@interface ChatModelTests : XCTestCase {
    KHChatModel *chatModel;
}

@end

@implementation ChatModelTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testInitChatModel {
    NSString *inputString = @"{    \"content\" : \"8900원의 행복?\",    \"articleid\" : \"5562c98a8509aeb87c17d7e0\",    \"time\" : \"15-05-25 17:06\",    \"_id\" : \"5562d8218509aeb87c17d7e5\",    \"user\" : {        \"userid\" : \"user02\",        \"nickname\" : \"노란 광대\",        \"icon\" : \"icon/icon2.png\"    }}";
    
    chatModel = [[KHChatModel alloc] initWithJson:inputString];
    XCTAssertEqualObjects(chatModel.content, @"8900원의 행복?");
    XCTAssertEqualObjects(chatModel.articleid, @"5562c98a8509aeb87c17d7e0");
    XCTAssertNotNil(chatModel.date);
    XCTAssertNotNil(chatModel.user.nickname);
}

@end
