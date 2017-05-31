//
//  UITextField+ChangeText.m
//  CustomKeyboard
//
//  Created by 武国斌 on 2017/5/31.
//  Copyright © 2017年 武国斌. All rights reserved.
//

#import "CustomKeyboardTextField+ChangeText.h"

@implementation CustomKeyboardTextField (ChangeText)

- (void)setAttr_Text:(NSString *)result {
    [self setText:result];
    NSDictionary *attrsDictionary =@{
                                     NSFontAttributeName: self.font,
                                     NSKernAttributeName:[NSNumber numberWithFloat:5.0f]//这里修改字符间距
                                     };
    self.attributedText=[[NSAttributedString alloc]initWithString:result attributes:attrsDictionary];
}

- (void)addCharacter:(NSString *)character {
    if (self.text.length > 0 && self.text.length >= self.max_length) {
        [self setAttr_Text:[self.text substringToIndex:self.max_length]];
        return;
    }
    NSString *temp = self.text;
    [self setAttr_Text:[temp stringByAppendingString:character]];
}

- (void)deleteCharacter {
    NSString *temp = self.text;
    if (temp.length > 0) {
        [self setAttr_Text:[temp substringToIndex:temp.length - 1]];
    }
}

@end
