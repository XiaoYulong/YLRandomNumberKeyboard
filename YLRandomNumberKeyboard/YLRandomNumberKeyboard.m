//
//  YLRandomNumberKeyboard.m
//  YLRandomNumberKeyboardDemo
//
//  Created by 肖 玉龙 on 15/3/26.
//  Copyright (c) 2015年 Yulong Xiao. All rights reserved.
//

#import "YLRandomNumberKeyboard.h"
#define margin 10

@interface YLRandomNumberKeyboard()
@property (nonatomic, strong) NSMutableArray *buttonArray;
@end

@implementation YLRandomNumberKeyboard

-(id)init{
    return [self initWithFrame:CGRectZero];
}

-(id)initWithFrame:(CGRect)frame
{
    self.buttonArray = [NSMutableArray arrayWithCapacity:20];
    
    CGRect realFrame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 256);
    self = [super initWithFrame:realFrame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        CGFloat buttonWidth = (self.bounds.size.width - margin * 6) / 5;
        CGFloat buttonHeight = (self.bounds.size.height - margin * 5) / 4;
        for (int i = 0; i< 20; ++i) {
            int row = i / 5;
            int column = i % 5;
            CGPoint origialPoint = CGPointMake((buttonWidth + margin) * column + margin, (buttonHeight + margin) * row + margin);
            CGRect buttonFrame = CGRectZero;
            buttonFrame.origin = origialPoint;
            buttonFrame.size.width = buttonWidth;
            buttonFrame.size.height = buttonHeight;
            UIButton *button = [[UIButton alloc] initWithFrame:buttonFrame];
            [button setTitle:[@(i) stringValue] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(numberButtonBeTouched:) forControlEvents:UIControlEventTouchUpInside];
            button.backgroundColor = [UIColor darkGrayColor];
            [self addSubview:button];
            [self.buttonArray addObject:button];
            
        }
        
    }
    return self;
}

-(void)numberButtonBeTouched:(UIButton *)button
{
    NSUInteger index = [self.buttonArray indexOfObject:button];
    [self.textInput insertText:[@(index) stringValue]];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.textInput performSelector:@selector(resignFirstResponder) withObject:nil];
}
@end
