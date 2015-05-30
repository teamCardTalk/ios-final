//
//  KHRealmTests.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 29..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <Realm/Realm.h>
#import "KHRealmTestUserModel.h"
#import "KHRealmTestRoomModel.h"
#import "KHRealmTestChatModel.h"


@interface KHRealmTests : XCTestCase

@end

@implementation KHRealmTests

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

- (void)testCreateObject {
    KHRealmTestUserModel *author = [[KHRealmTestUserModel alloc] init];
    author.nickname = @"asdf";
    author.iconURL = @"asdfasdfa";
    KHRealmTestUserModel *author1 = [[KHRealmTestUserModel alloc] init];
    author1.nickname = @"fodrh1201";
    author1.iconURL = @"nakfndksjfksdj";
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:author];
    [realm addObject:author1];
    [realm commitWriteTransaction];
    
    RLMResults *authors = [KHRealmTestUserModel allObjects];
    NSLog(@"%@", authors);
}

- (void)testGetObject {
    RLMResults *authors = [KHRealmTestUserModel allObjects];
    NSLog(@"%@", authors);
}

- (void)testResetObject {
    [[NSFileManager defaultManager] removeItemAtPath:[RLMRealm defaultRealmPath] error:nil];
    RLMResults *authors = [KHRealmTestUserModel allObjects];
    NSLog(@"%@", authors);
}

- (void)testConditionalQuery {
    RLMResults *specialAuthor = [KHRealmTestUserModel objectsWhere:@"nickname BEGINSWITH 'a'"];
    NSLog(@"%@", specialAuthor);
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"nickname BEGINSWITH %@", @"f"];
    specialAuthor = [KHRealmTestUserModel objectsWithPredicate:pred];
    NSLog(@"%@", specialAuthor);
}

- (void)testSortedResult {
    RLMResults *sortedAuthor = [[KHRealmTestUserModel allObjects] sortedResultsUsingProperty:@"nickname" ascending:NO];
    NSLog(@"%@", sortedAuthor);
}





















@end
