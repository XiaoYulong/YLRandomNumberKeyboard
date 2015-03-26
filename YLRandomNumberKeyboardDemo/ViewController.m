//
//  ViewController.m
//  YLRandomNumberKeyboardDemo
//
//  Created by 肖 玉龙 on 15/3/26.
//  Copyright (c) 2015年 Yulong Xiao. All rights reserved.
//

#import "ViewController.h"
#import "YLRandomNumberKeyboard.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 60, 300, 40)];
    [textField useYLRandomNumberKeyboard];
    textField.borderStyle = UITextBorderStyleLine;
    textField.placeholder = @"please input ...";
    [self.view addSubview:textField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
