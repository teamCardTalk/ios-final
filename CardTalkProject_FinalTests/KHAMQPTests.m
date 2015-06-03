//
//  KHAMQPTests.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 31..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AMQPConnection.h"
#import "AMQPChannel.h"
#import "AMQPConsumer.h"
#import "AMQPQueue.h"



@interface KHAMQPTests : XCTestCase {
    
}
@end

@implementation KHAMQPTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    @try {
       
    }
    @catch (NSException *exception) {
        NSLog(@"exeception %@", exception);
    }
    @finally {
        
    }
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//- (void)testExample {
//    // This is an example of a functional test case.
//    XCTAssert(YES, @"Pass");
//}
//
//- (void)testConsume {
////    dispatch_queue_t serialQueue = dispatch_queue_create("amqp.thread", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t mainQueue = dispatch_get_main_queue();
//    KHAMQPTestConsumer *delegate = [[KHAMQPTestConsumer alloc] init];
//    NSDictionary *configuration = @{ @"host":@"localhost", @"port":@"15672", @"username":@"guest", @"password":@"guest", @"vhost":@"/" };
//    KHAMQPThreadTest *amqpThread = [[KHAMQPThreadTest alloc] initWithConfiguration:configuration exchangeKey:@"push" topic:@"room01" delegate:delegate callbackQueue:mainQueue queueName:@"user02"];
//    
//    [amqpThread main];
//    
//    
//    
//}
//
- (void)testConnection {
    
}

@end
