//
//  ViewController.m
//  CustomKeyboard
//
//  Created by 武国斌 on 2017/5/31.
//  Copyright © 2017年 武国斌. All rights reserved.
//

#import "ViewController.h"
#import "CustomKeyboardTextField.h"

#define standardWidth ([UIScreen mainScreen].bounds.size.width)
#define standardHeight ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()

@property (nonatomic, strong) CustomKeyboardTextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTapped)];
    [self.view addGestureRecognizer:recognizer];

    [self textField];
}

- (CustomKeyboardTextField *)textField {
    if (!_textField) {
        _textField = [[CustomKeyboardTextField alloc] initWithFrame:CGRectMake(10, 20, standardWidth - 20, 50)];
        [_textField setup];
        [_textField setSecureTextEntry:YES];
        [_textField setMax_length:11];
        [self.view addSubview:_textField];
    }
    return _textField;
}

- (void)backgroundTapped {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
