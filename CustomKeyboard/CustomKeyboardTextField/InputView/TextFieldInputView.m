//
//  TextFieldInputView.m
//  CustomKeyboard
//
//  Created by 武国斌 on 2017/5/31.
//  Copyright © 2017年 武国斌. All rights reserved.
//

#import "TextFieldInputView.h"

@implementation TextFieldInputView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.backgroundColor = [UIColor cyanColor];
    
    CGFloat standardWidth = (([UIScreen mainScreen].bounds.size.width - 2) / 3);
    
    NSArray *datas = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TextInputKeyboard" ofType:@"plist"]];
    
    for (NSInteger i = 0; i < 12; i++) {
//        NSLog(@"row %ld,item %ld",i/3 + 1,i%3 + 1);
        
        NSDictionary *data = [datas objectAtIndex:i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setFrame:CGRectMake(i%3 * (standardWidth + 1), i/3 * 70 + i/3 + 1, standardWidth, 70)];
        [button setBackgroundColor:[UIColor whiteColor]];
        
        [button setTitle:[data objectForKey:@"title"] forState:UIControlStateNormal];
        [button setTag:[[data objectForKey:@"value"] integerValue]];
        
        [button addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
}

- (void)buttonTap:(UIButton *)sender {
    NSInteger tag = sender.tag;
    
    if (tag == -1) {
        self.callback(TextFieldInputSingnalDelete, nil);
    }else if(tag == -2) {
        self.callback(TextFieldInputSingnalSubmit, nil);
    }else {
        self.callback(TextFieldInputSingnalNumber, [NSString stringWithFormat:@"%li",tag]);
    }
}

+ (TextFieldInputView *)inputView {
    return [[TextFieldInputView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 280 + 3)];
}

- (TextFieldInputView *)setCallBack:(void (^)(TextFieldInputSingnal, NSString *))callback {
    self.callback = callback;
    return self;
}

@end
