//
//  YLRandomNumberKeyboard.m
//  YLRandomNumberKeyboardDemo
//
//  Created by 肖 玉龙 on 15/3/26.
//  Copyright (c) 2015年 Yulong Xiao. All rights reserved.
//

#import "YLRandomNumberKeyboard.h"
#define margin 0.5
#define YLRNKMarginColor [UIColor colorWithRed:209/255.0 green:209/255.0 blue:209/255.0 alpha:1]
#define YLRNKButtonTouchedColor [UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1]
#define YLRNKBlueColor [UIColor colorWithRed:35/255.0 green:147/255.0 blue:241/255.0 alpha:1]
#define YLRNKLightBlueColor [UIColor colorWithRed:39/255.0 green:158/255.0 blue:255/255.0 alpha:1]

@interface YLRandomNumberKeyboard()
@property (nonatomic, strong) NSMutableArray *buttonArray;
@property (nonatomic, strong) NSMutableArray *randomDigitsArray;
@end

@implementation YLRandomNumberKeyboard

-(id)init{
    return [self initWithFrame:CGRectZero];
}

-(id)initWithFrame:(CGRect)frame
{
    CGRect realFrame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 236);
    self = [super initWithFrame:realFrame];
    
    if (self) {
        self.buttonArray = [NSMutableArray arrayWithCapacity:20];
        self.randomDigitsArray = [NSMutableArray arrayWithCapacity:10];
        NSMutableArray *digitsArray = [@[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9"] mutableCopy];
        while(digitsArray.count > 0){
            int index = arc4random() % [digitsArray count];
            [self.randomDigitsArray addObject:digitsArray[index]];
            [digitsArray removeObjectAtIndex:index];
        }
    
        self.backgroundColor = YLRNKMarginColor;
        CGFloat buttonWidth = (self.bounds.size.width - margin * 5) / 4;
        CGFloat buttonHeight = (self.bounds.size.height - margin * 5) / 4;
        for (int i = 0; i< 12; ++i) {
            int row = i / 3;
            int column = i % 3;
            CGPoint origialPoint = CGPointMake((buttonWidth + margin) * column + margin, (buttonHeight + margin) * row + margin);
            CGRect buttonFrame = CGRectZero;
            buttonFrame.origin = origialPoint;
            buttonFrame.size.width = buttonWidth;
            buttonFrame.size.height = buttonHeight;
            UIButton *button = [[UIButton alloc] initWithFrame:buttonFrame];
            [self costumButtonAppearence:button];
            [button addTarget:self action:@selector(numberButtonBeTouched:) forControlEvents:UIControlEventTouchUpInside];
    
            [self addSubview:button];
            [self.buttonArray addObject:button];
            
        }
        for(int i = 0; i < 9; ++i){
            UIButton *digitButton = self.buttonArray[i];            
            [digitButton setTitle:self.randomDigitsArray[i] forState:UIControlStateNormal];
        }
        UIButton *lastDigitButton = self.buttonArray[10];
        [lastDigitButton setTitle:self.randomDigitsArray[9] forState:UIControlStateNormal];
        
        UIButton *pointButton = self.buttonArray[9];
        [pointButton setTitle:@"." forState:UIControlStateNormal];
        
        UIButton *hideKeyboardButton = self.buttonArray[11];
        [hideKeyboardButton setTitle:@"hide" forState:UIControlStateNormal];
        
        UIButton *deleteButton = [[UIButton alloc] init];
        CGRect deleteButtonFrame = CGRectZero;
        deleteButtonFrame.origin = CGPointMake((buttonWidth + margin) * 3 + margin, (buttonHeight + margin) * 0 + margin);
        deleteButtonFrame.size = CGSizeMake(buttonWidth, buttonHeight * 2 + margin);
        deleteButton.frame = deleteButtonFrame;
        [deleteButton addTarget:self action:@selector(deleteButtonBeTouched:) forControlEvents:UIControlEventTouchUpInside];
        [deleteButton setTitle:@"delete" forState:UIControlStateNormal];
        [self costumButtonAppearence:deleteButton];
        [self addSubview:deleteButton];
        
        UIButton *returnButton = [[UIButton alloc] init];
        CGRect returnButtonFrame = CGRectZero;
        returnButtonFrame.origin = CGPointMake((buttonWidth + margin) * 3 + margin, (buttonHeight + margin) * 2 + margin);
        returnButtonFrame.size = CGSizeMake(buttonWidth, buttonHeight * 2 + margin);
        returnButton.frame = returnButtonFrame;
        [returnButton addTarget:self action:@selector(returnButtonBeTouched:) forControlEvents:UIControlEventTouchUpInside];
        [returnButton setTitle:@"return" forState:UIControlStateNormal];
        [self costumReturnButtonAppearence:returnButton];
        [self addSubview:returnButton];

        
        
        
    }
    return self;
}

-(void)numberButtonBeTouched:(UIButton *)button
{
    NSUInteger index = [self.buttonArray indexOfObject:button];
    if (index < 9) {
        [self.textInput insertText:self.randomDigitsArray[index]];
    }else if (index == 9){
        [self.textInput insertText:@"."];
    }else if (index == 10){
        [self.textInput insertText:self.randomDigitsArray[9]];
    }else{
        [self.textInput performSelector:@selector(resignFirstResponder) withObject:nil];
    }
}

-(void)deleteButtonBeTouched:(UIButton *)button
{
    [self.textInput deleteBackward];
}

-(void)returnButtonBeTouched:(UIButton *)button
{
    [[(UITextField *)self.textInput delegate] textFieldShouldReturn:(UITextField *)self.textInput];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.textInput performSelector:@selector(resignFirstResponder) withObject:nil];
}

-(UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

-(void)costumButtonAppearence:(UIButton *)button
{
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:29];
    [button setBackgroundImage:[self imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [button setBackgroundImage:[self imageWithColor:YLRNKButtonTouchedColor] forState:UIControlStateHighlighted];

}

-(void)costumReturnButtonAppearence:(UIButton *)button
{
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[self imageWithColor:YLRNKBlueColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[self imageWithColor:YLRNKLightBlueColor] forState:UIControlStateHighlighted];
}
@end
