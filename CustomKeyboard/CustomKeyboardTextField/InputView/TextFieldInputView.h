//
//  TextFieldInputView.h
//  CustomKeyboard
//
//  Created by 武国斌 on 2017/5/31.
//  Copyright © 2017年 武国斌. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TextFieldInputSingnal) {
    TextFieldInputSingnalNumber,
    TextFieldInputSingnalDelete,
    TextFieldInputSingnalSubmit
};

@interface TextFieldInputView : UIView

@property (nonatomic, copy) void (^callback)(TextFieldInputSingnal signal, NSString *result);

+ (TextFieldInputView *)inputView;

- (TextFieldInputView *)setCallBack:(void (^)(TextFieldInputSingnal signal, NSString *result))callback;

@end
