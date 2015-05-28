//
//  RoomModelTest.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 27..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "KHRoomModel.h"

@interface RoomModelTest : XCTestCase {
    KHRoomModel *room;
    KHCardModel *card;
}

@end

@implementation RoomModelTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSString *cardJsonString = @"{    \"status\" : \"1\",    \"partynumber\" : \"1\",    \"content\" : \"고양이는 귀엽습니다. 그렇습니다.\",    \"createtime\" : \"15-05-24 19:07\",    \"title\" : \"녹색 여왕의 알콩달콩한 다락방\",    \"_id\" : \"5561a2c76800d5774f77d5e0\",    \"file\" : [         {            \"path\" : \"../data/upload_32295249878886ab59f1a3bec635b9c1.JPG\",            \"name\" : \"cat01.JPG\",            \"_id\" : \"5561a2c76800d5774f77d5e1\"        }    ],    \"author\" : {        \"userid\" : \"user02\",        \"nickname\" : \"노란 광대\",        \"icon\" : \"icon/icon2.png\"    },    \"__v\" : 0}";
    
    card = [[KHCardModel alloc] initWithJsonString:cardJsonString];
    room = [[KHRoomModel alloc] initWithCard:card];
    
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testAddChat {
    NSString *chatString = @"{    \"content\" : \"8900원의 행복?\",    \"articleid\" : \"5562c98a8509aeb87c17d7e0\",    \"time\" : \"15-05-25 17:06\",    \"_id\" : \"5562d8218509aeb87c17d7e5\",    \"user\" : {        \"userid\" : \"user02\",        \"nickname\" : \"노란 광대\",        \"icon\" : \"icon/icon2.png\"    }}";
    KHChatModel *chat = [[KHChatModel alloc] initWithJson:chatString];
    [room addChatToChatList:chat];
    XCTAssertEqual(room.chatList.count, 1);
}

- (void)testGetRecentChat {
    NSString *chatString1 = @"{    \"content\" : \"8900원의 행복?\",    \"articleid\" : \"5562c98a8509aeb87c17d7e0\",    \"time\" : \"15-05-25 17:06\",    \"_id\" : \"5562d8218509aeb87c17d7e5\",    \"user\" : {        \"userid\" : \"user02\",        \"nickname\" : \"노란 광대\",        \"icon\" : \"icon/icon2.png\"    }}";
    NSString *chatString2 = @"{    \"content\" : \"8900원의 행복?\",    \"articleid\" : \"5562c98a8509aeb87c17d7e0\",    \"time\" : \"15-05-20 17:06\",    \"_id\" : \"5562d8218509aeb87c17d7e5\",    \"user\" : {        \"userid\" : \"user02\",        \"nickname\" : \"노란 광대\",        \"icon\" : \"icon/icon2.png\"    }}";
    
    KHChatModel *chat01 = [[KHChatModel alloc] initWithJson:chatString1];
    KHChatModel *chat02 = [[KHChatModel alloc] initWithJson:chatString2];
    [room addChatToChatList:chat01];
    [room addChatToChatList:chat02];
    NSArray *recentChats = [room recentChats];
    chat01 = recentChats[0];
    chat02 = recentChats[1];
    XCTAssertNotNil(chat01);
    XCTAssertNotNil(chat02);
    XCTAssertEqualObjects([chat02.date laterDate:chat01.date], chat02.date);
}


@end
