//
//  ViewController.m
//  VerificationCodeView
//
//  Created by LSFB on 2017/6/4.
//  Copyright © 2017年 BlueStorm. All rights reserved.
//

#import "ViewController.h"
#import "BSValidationView.h"

@interface ViewController () <UITextFieldDelegate> {

    BSValidationView *codeView;
    UITextField *testTF;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    codeView = [[BSValidationView alloc] initWithFrame:CGRectMake(0, 0, 100, 45)];
    codeView.center = CGPointMake(self.view.center.x, self.view.center.y - 60);
    [self.view addSubview:codeView];
    testTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 45)];
    testTF.backgroundColor = [UIColor lightGrayColor];
    testTF.delegate = self;
    testTF.center = CGPointMake(codeView.center.x, codeView.center.y + 60);
    [self.view addSubview:testTF];
    
}


- (void)textFieldDidEndEditing:(UITextField *)textField {

    if ([textField.text isEqualToString:codeView.changeString]) {
        NSLog(@"验证码输入正确");
    }else {
        NSLog(@"验证码输入错误");
    }

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
    
}



@end
