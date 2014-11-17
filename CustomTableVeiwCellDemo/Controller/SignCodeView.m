//
//  LoginView.m
//  Blueberry
//
//  Created by huiter on 13-10-28.
//  Copyright (c) 2013年 GuoKu. All rights reserved.
//

#import "SignCodeView.h"
#import "WConfig.h"
#import "WUtils.h"
#import "WAppDelegate.h"
#import "MASConstraintMaker.h"
#import "View+MASAdditions.h"
#import "SignUpView.h"

@interface SignCodeView () <UITextFieldDelegate, UIAlertViewDelegate>
{
@private
    UILabel * tip;
    UIView * whiteBG;
}
@property (nonatomic, strong) UITextField *emailTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UIButton *forgotPasswordButton;
@property (nonatomic, strong) UIButton *sinaWeiboButton;
@property (nonatomic, strong) UIButton *taobaoButton;
@end

@implementation SignCodeView

- (id)initWithFrame:(CGRect)frame
{
    WAppDelegate *delegate = [WUtils sharedAppdelegate];
    self = [super initWithFrame: delegate.window.frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        whiteBG = [[UIView alloc]initWithFrame:CGRectMake(20, 80, self.frame.size.width-40, 330)];
        whiteBG.backgroundColor = [UIColor whiteColor];
        whiteBG.layer.cornerRadius = 4.0f;
        whiteBG.layer.masksToBounds = YES;
        [self addSubview:whiteBG];
        
        UITapGestureRecognizer *Tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignResponder)];
        [whiteBG addGestureRecognizer:Tap2];
        
        
        UIButton *titleTextField = [[UIButton alloc]init];
        titleTextField.backgroundColor = [UIColor clearColor];
        [titleTextField setTitle:@"验证码已经发送至尾号为7126的号码 [剩余时间 30]" forState:UIControlStateNormal];
        [titleTextField setTitleColor:[WConfig hexStringToColor:@"#dcdcdc"] forState:UIControlStateNormal];
        [WConfig setLabelWithNormalTitleStyle:titleTextField.titleLabel];
        titleTextField.titleLabel.textAlignment = NSTextAlignmentCenter;
        titleTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        
        _emailTextField = [UITextField new];
        self.emailTextField.delegate = self;
        self.emailTextField.borderStyle = UITextBorderStyleNone;
        self.emailTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.emailTextField.keyboardType = UIKeyboardTypeEmailAddress;
        self.emailTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 16., 45.)];
        self.emailTextField.leftViewMode = UITextFieldViewModeAlways;
        self.emailTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.emailTextField.placeholder = @"验证码";
        self.emailTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.emailTextField.returnKeyType = UIReturnKeyNext;
        self.emailTextField.keyboardType = UIKeyboardTypeEmailAddress;
        [self.emailTextField setTextColor:[WConfig hexStringToColor:@"#666666"]];
        self.emailTextField.backgroundColor = [WConfig hexStringToColor:@"#f4f4f4"];
        
        UIButton *loginButton = [[UIButton alloc]init];
        loginButton.layer.cornerRadius = 2;
        loginButton.layer.masksToBounds = YES;
        loginButton.backgroundColor = [WConfig hexStringToColor:@"#457ebd"];
        [loginButton setTitle:@"提交" forState:UIControlStateNormal];
        [loginButton setTitleColor: [WConfig hexStringToColor:@"#ffffff"] forState:UIControlStateNormal];
        [loginButton addTarget:self action:@selector(tapLoginButton) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *registerButton = [[UIButton alloc]init];
        registerButton.backgroundColor = [UIColor clearColor];
        [registerButton setTitle:@"重发验证码" forState:UIControlStateNormal];
        [registerButton setTitleColor:[WConfig hexStringToColor:@"#dcdcdc"] forState:UIControlStateNormal];
        [WConfig setLabelWithNormalTitleStyle:registerButton.titleLabel];
        registerButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        registerButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [registerButton addTarget:self action:@selector(tapRegisterButton) forControlEvents:UIControlEventTouchUpInside];
        
        UIView *superview = whiteBG;
        UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
        
        
        [whiteBG addSubview:titleTextField];
        [titleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview.mas_top).insets(UIEdgeInsetsMake(50, 10, 10, 10));
            make.right.left.equalTo(superview).insets(padding);
            make.height.equalTo(@(50)).insets(padding);
        }];
        
        [whiteBG addSubview:self.emailTextField];
        [self.emailTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(titleTextField.mas_bottom).insets(padding);
            make.right.left.equalTo(superview).insets(padding);
            make.height.equalTo(@(50)).insets(padding);
        }];
        
        [whiteBG addSubview:loginButton];
        [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.equalTo(superview).insets(padding);
            make.top.equalTo(_emailTextField.mas_bottom).insets(padding);
            make.height.equalTo(@(50)).insets(padding);
        }];
        
        [whiteBG addSubview:registerButton];
        [registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.equalTo(superview).insets(padding);
            make.top.equalTo(loginButton.mas_bottom).insets(padding);
            make.height.equalTo(@(50)).insets(padding);
        }];
    }
    return self;
}
#pragma mark - Selector Method

- (void)tapLoginButton
{
    NSLog(@"========tapLoginButton==========");
}

- (void)tapForgotPasswordButton
{
    
}

- (void)tapRegisterButton
{
    
}

- (void)resignResponder
{
    [self.emailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

- (void)show
{
    self.alpha = 0;

    WAppDelegate *delegate = [WUtils sharedAppdelegate];
    [delegate.window addSubview:self];
   
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
        } completion:^(BOOL finished) {
            
        }];
    }];
}
- (void)dismiss
{
    self.alpha = 1;
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

@end
