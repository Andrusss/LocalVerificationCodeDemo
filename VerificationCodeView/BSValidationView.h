//
//  BSValidationView.h
//  VerificationCodeView
//
//  Created by LSFB on 2017/6/4.
//  Copyright © 2017年 BlueStorm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BSValidationView : UIView

/**
 字符素材数组
 */
@property (nonatomic, retain) NSArray *changeArray;
/**
 验证码的字符串
 */
@property (nonatomic, retain) NSMutableString *changeString;
/**
 验证码长度
 */
@property (assign, nonatomic) NSUInteger codeLength;
/**
 干扰线个数
 */
@property (assign, nonatomic) NSUInteger lineCount;

@end
