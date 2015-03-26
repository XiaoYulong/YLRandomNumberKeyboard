//
//  UITextField+YLRandomNumberKeyboard.m
//  YLRandomNumberKeyboardDemo
//
//  Created by 肖 玉龙 on 15/3/26.
//  Copyright (c) 2015年 Yulong Xiao. All rights reserved.
//

#import "UITextField+YLRandomNumberKeyboard.h"
#import "YLRandomNumberKeyboard.h"
@implementation UITextField(YLRandomNumberKeyboard)
-(void)useYLRandomNumberKeyboard
{
    YLRandomNumberKeyboard *keyboard = [YLRandomNumberKeyboard new];
    self.inputView = keyboard;
    keyboard.textInput = self;
}
@end

