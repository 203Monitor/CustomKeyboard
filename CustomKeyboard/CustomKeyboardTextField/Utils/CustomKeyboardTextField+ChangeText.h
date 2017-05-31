//
//  UITextField+ChangeText.h
//  CustomKeyboard
//
//  Created by 武国斌 on 2017/5/31.
//  Copyright © 2017年 武国斌. All rights reserved.
//

#import "CustomKeyboardTextField.h"

@interface CustomKeyboardTextField (ChangeText)

- (void)addCharacter:(NSString *)character;
- (void)deleteCharacter;

@end
