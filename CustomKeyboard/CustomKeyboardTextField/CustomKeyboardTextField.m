//
//  CustomKeyboardTextField.m
//  CustomKeyboard
//
//  Created by 武国斌 on 2017/5/31.
//  Copyright © 2017年 武国斌. All rights reserved.
//

#import "CustomKeyboardTextField.h"
#import "TextFieldInputView.h"
#import "CustomKeyboardTextField+ChangeText.h"

@implementation CustomKeyboardTextField

- (void)setup {
    [self setMax_length:0];
    __weak typeof(&*self) weakSelf = self;
    [self setInputView:[[TextFieldInputView inputView] setCallBack:^(TextFieldInputSingnal signal, NSString *result) {
        if (signal == TextFieldInputSingnalDelete) {
            [weakSelf deleteCharacter];
        }else if(signal == TextFieldInputSingnalSubmit) {
            [weakSelf endEditing:YES];
            NSLog(@"%@",self.text);
        }else {
            [weakSelf addCharacter:result];
        }
    }]];
}

@end
