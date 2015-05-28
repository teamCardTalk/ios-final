//
//  ImageFileModelTests.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 27..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "KHImageFileModel.h"

@interface ImageFileModelTests : XCTestCase {
    KHImageFileModel *imageFileModel;
}

@end

@implementation ImageFileModelTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    imageFileModel = [[KHImageFileModel alloc] initWithImageInfo:@{
                                                                   @"path" : @"../data/upload_32295249878886ab59f1a3bec635b9c1.JPG",
                                                                   @"name" : @"cat01.JPG",
                                                                   @"_id" : @"5561a2c76800d5774f77d5e1"
                                                                   }];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testGetFileName {
    NSString *result = [imageFileModel getFileName];
    XCTAssertEqualObjects(result, @"upload_32295249878886ab59f1a3bec635b9c1.JPG");
}
@end
