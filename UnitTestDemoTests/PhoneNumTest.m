//
//  PhoneNumTest.m
//  UnitTestDemo
//
//  Created by 李献红 on 17/6/1.
//  Copyright © 2017年 李献红. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
@interface PhoneNumTest : XCTestCase
@property (nonatomic, strong) ViewController *vc;
@end

@implementation PhoneNumTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.vc = [[ViewController alloc]init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testIsLegalPhoneNum {
    
//    XCTAssertTrue([self.vc isLegalPhoneNum:@"8383187312"]);
    XCTAssertTrue([self.vc isLegalPhoneNum:@"13103876512"]);
//    XCTAssertTrue([self.vc isLegalPhoneNum:@"haha"]);
//    XCTAssertTrue([self.vc isLegalPhoneNum:@"dododod"]);
    XCTAssertTrue([self.vc isLegalPhoneNum:@"15967863422"]);

    BOOL isLegal = [self.vc isLegalPhoneNum:@"83831873132"];
    NSLog(@"-----%@----",isLegal?@"YES":@"NO");
    XCTAssert(isLegal == YES,@"测试不通过");


}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        for (int i = 0; i < 100; ++i) {
             [self testIsLegalPhoneNum];
        }
        // Put the code you want to measure the time of here.
    }];
}

@end
