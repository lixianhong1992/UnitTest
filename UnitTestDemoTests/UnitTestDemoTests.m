//
//  UnitTestDemoTests.m
//  UnitTestDemoTests
//
//  Created by 李献红 on 17/6/1.
//  Copyright © 2017年 李献红. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UnitTestDemoTests : XCTestCase

@end

@implementation UnitTestDemoTests

- (void)setUp {
    [super setUp];
    //invocation 调用
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    //析构
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    //这个方法主要是做性能测试的，所谓性能测试，主要就是评估一段代码的运行时间。该方法就是性能测试方法的样例。
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        NSLog(@"--------");
    }];
}

@end
