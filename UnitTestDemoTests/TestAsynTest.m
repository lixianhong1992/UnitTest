//
//  TestAsynTest.m
//  UnitTestDemo
//
//  Created by 李献红 on 17/6/1.
//  Copyright © 2017年 李献红. All rights reserved.
//

#import <XCTest/XCTest.h>

#define WAIT do {\
[self expectationForNotification:@"AsynTest" object:nil handler:nil];\
[self waitForExpectationsWithTimeout:3 handler:nil];\
} while (0);

#define NOTIFY \
[[NSNotificationCenter defaultCenter]postNotificationName:@"AsynTest" object:nil];
@interface TestAsynTest : XCTestCase

@end

@implementation TestAsynTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAsyn {

    //进入该方法就开始计时
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [queue addOperationWithBlock:^{
        //模拟网络请求
        sleep(2);
        NOTIFY;//在这里通知已经完成
    }];
    WAIT;
}


- (void)testAsynSleepOnMainThread {
    
    sleep(4);//在主线程的延迟与timeOut无关
    //进入该方法就开始计时
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [queue addOperationWithBlock:^{
        //模拟网络请求
        
        NOTIFY;//在这里通知已经完成
    }];
    WAIT;
}

- (void)testAysn2{

    XCTestExpectation *exp = [self expectationWithDescription:@"时间超时"];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [queue addOperationWithBlock:^{
        //模拟网络请求
        sleep(3);
        //模拟获取的异步操作后，获取结果，判断异步方法的结果是否正确
        NSString *jsonStr = @"假如这是通过网络获取的json字符串";
        XCTAssertNotNil(jsonStr,@"获取网络数据失败");
        
        //如果断言没问题，就调用fulfill宣布测试满足
        [exp fulfill];
        
    }];
    //设置延迟多少秒后，如果没有满足测试条件就报错
    [self waitForExpectationsWithTimeout:2 handler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"--------Timeout Error: %@", error);
        }
    }];

    
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
