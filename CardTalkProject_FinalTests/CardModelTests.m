//
//  CardModelTests.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 27..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "KHCardModel.h"

@interface CardModelTests : XCTestCase {
    KHCardModel *card;
}

@end

@implementation CardModelTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    card = nil;
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

- (void)testCard가_존재한다 {
    
    card = [[KHCardModel alloc] init];
    XCTAssertNotNil(card, @"should create a Card instance");
}

- (void)testThatCardHasIcon_Date_Title_TextContent_imageNameList_numberOfParticipiant {
    card = [[KHCardModel alloc] initWithTitle:@"title"
                                      content:@"hihihihi"
                                    imageList:@[]];
}

- (void)testParsingJsonString {
    NSString *jsonString = @"{\"title\" : \"title\", \"iconName\" : \"beard.jpg\", \"date\" : \"2015-05-29\", \"textContent\" : \"안녕하세요. 안녕하세요.\", \"imageNameList\" : [\"img01.jpg\", \"img02.jpg\"], \"numberOfParticipiant\" : 5}";
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding]
                                                         options:NSJSONReadingMutableContainers error:nil];
    
    NSDictionary *dict = @{
                           @"title" : @"title",
                           @"iconName" : @"beard.jpg",
                           @"date" : @"2015-05-29",
                           @"textContent" : @"안녕하세요. 안녕하세요.",
                           @"imageNameList" : @[@"img01.jpg", @"img02.jpg"],
                           @"numberOfParticipiant" : @5
                           };
    XCTAssertEqualObjects(json, dict);
}

- (void)testThatInitWithJsonArgument {
//    NSString *jsonString = @"{    \"status\" : \"1\",    \"partynumber\" : \"1\",    \"content\" : \"고양이는 귀엽습니다. 그렇습니다.\",    \"createtime\" : \"15-05-24 19:07\",    \"title\" : \"녹색 여왕의 알콩달콩한 다락방\",    \"_id\" : \"5561a2c76800d5774f77d5e0\",    \"file\" : [         {            \"path\" : \"../data/upload_32295249878886ab59f1a3bec635b9c1.JPG\",            \"name\" : \"cat01.JPG\",            \"_id\" : \"5561a2c76800d5774f77d5e1\"        }    ],    \"author\" : {        \"userid\" : \"user02\",        \"nickname\" : \"노란 광대\",        \"icon\" : \"icon/icon2.png\"    },    \"__v\" : 0}";
//    card = [[KHCardModel alloc] initWithJsonString:jsonString];
//    NSArray *imageList = [KHImageFileModel getImageListFromImageInfoDict:@[
//                                                                           @{
//                                                                               @"path" : @"../data/upload_32295249878886ab59f1a3bec635b9c1.JPG",
//                                                                               @"name" : @"cat01.JPG",
//                                                                               @"_id" : @"5561a2c76800d5774f77d5e1"
//                                                                               }
//                                                                           ]];
//    
//    KHImageFileModel *image0 = card.imageList[0];
//    KHImageFileModel *image1 = imageList[0];
//    KHUserModel *author = [[KHUserModel alloc] initWithUserInfo:@{
//                                                                  @"userid" : @"user02",
//                                                                  @"nickname" : @"노란 광대",
//                                                                  @"icon" : @"icon/icon2.png"
//                                                                  }];
//    
//    XCTAssertEqualObjects(card.title, @"녹색 여왕의 알콩달콩한 다락방");
//    XCTAssertEqualObjects(image0.path, image1.path);
//    XCTAssertEqualObjects(image0.path, image1.path);
//    XCTAssertEqualObjects(card.author.nickname, author.nickname);
//    XCTAssertEqualObjects(card.author.icon, author.icon);
//    XCTAssertEqual(card.imageList.count, imageList.count);
//    XCTAssertEqual(card.status, 1);
//    
}

- (void)test100자로_잘려서_content가_보여야_한다 {
    card = [[KHCardModel alloc] init];
    card.content = @"IFF this did not fail, your restaurantsObjects should now be an NSArray object containing the restaurants as NSDictionarys.";
    [card showShortTextContents];
    NSLog(@"%@", card.content);
}

- (void)testConvertDateStringToNSDate {
    card = [[KHCardModel alloc] init];
    NSString *inputDateString = @"15-05-25 16:04";
    NSDate *date = [card convertDateStringToNSDate:inputDateString];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    dateFormat.dateFormat = @"yy-MM-dd HH:mm";
    NSString *result = [dateFormat stringFromDate:date];
    
    XCTAssertEqualObjects(inputDateString, result);
}

@end
