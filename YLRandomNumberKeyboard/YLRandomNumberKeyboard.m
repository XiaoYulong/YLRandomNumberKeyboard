//
//  YLRandomNumberKeyboard.m
//  YLRandomNumberKeyboardDemo
//
//  Created by 肖 玉龙 on 15/3/26.
//  Copyright (c) 2015年 Yulong Xiao. All rights reserved.
//

#import "YLRandomNumberKeyboard.h"

@implementation YLRandomNumberKeyboard

-(id)init{
    return [self initWithFrame:CGRectZero];
}

-(id)initWithFrame:(CGRect)frame
{
    CGRect realFrame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, 216);
    self = [super initWithFrame:realFrame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
