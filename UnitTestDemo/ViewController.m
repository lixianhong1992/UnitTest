//
//  ViewController.m
//  UnitTestDemo
//
//  Created by 李献红 on 17/6/1.
//  Copyright © 2017年 李献红. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)login:(id)sender {
    
}



/**
 判断是否是有效手机号

 @param phone 手机号

 @return YES or NO
 */
- (BOOL)isLegalPhoneNum:(NSString *)phone {

    //手机号以13， 15，18，14，17开头，八个 \d 数字字符
    NSString * phoneRegex = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[0678]|18[0-9]|14[57])[0-9]{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:phone];

   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
