//
//  LoginView.m
//  Blueberry
//
//  Created by huiter on 13-10-28.
//  Copyright (c) 2013年 GuoKu. All rights reserved.
//

#import "SignUpView.h"
#import "WConfig.h"
#import "WUtils.h"
#import "WAppDelegate.h"
#import "MASConstraintMaker.h"
#import "View+MASAdditions.h"
#import "LoginView.h"

@interface SignUpView () <UITextFieldDelegate, UIAlertViewDelegate>
{
@private
    UILabel * tip;
    UIView * whiteBG;
}
@property (nonatomic, strong) UITextField *emailTextField;
@property (nonatomic, strong) UITextField *nickTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UIButton *forgotPasswordButton;
@end

@implementation SignUpView

- (id)initWithFrame:(CGRect)frame
{
    WAppDelegate *delegate = [WUtils sharedAppdelegate];
    self = [super initWithFrame: delegate.window.frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        whiteBG = [[UIView alloc]initWithFrame:CGRectMake(20, 80, self.frame.size.width-40, 350)];
        whiteBG.backgroundColor = [UIColor whiteColor];
        whiteBG.layer.cornerRadius = 4.0f;
        whiteBG.layer.masksToBounds = YES;
        [self addSubview:whiteBG];
        
        UITapGestureRecognizer *Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [self addGestureRecognizer:Tap];
        UITapGestureRecognizer *Tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignResponder)];
        [whiteBG addGestureRecognizer:Tap2];
        
        _emailTextField = [UITextField new];
        self.emailTextField.delegate = self;
        self.emailTextField.borderStyle = UITextBorderStyleNone;
        self.emailTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.emailTextField.keyboardType = UIKeyboardTypeEmailAddress;
        self.emailTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 16., 45.)];
        self.emailTextField.leftViewMode = UITextFieldViewModeAlways;
        self.emailTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.emailTextField.placeholder = @"手机号码";
        self.emailTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.emailTextField.returnKeyType = UIReturnKeyNext;
        self.emailTextField.keyboardType = UIKeyboardTypeEmailAddress;
        [self.emailTextField setTextColor:[WConfig hexStringToColor:@"#666666"]];
        self.emailTextField.backgroundColor = [WConfig hexStringToColor:@"#f4f4f4"];
        
        _nickTextField = [UITextField new];
        self.nickTextField.delegate = self;
        self.nickTextField.borderStyle = UITextBorderStyleNone;
        self.nickTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.nickTextField.keyboardType = UIKeyboardTypeEmailAddress;
        self.nickTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 16., 45.)];
        self.nickTextField.leftViewMode = UITextFieldViewModeAlways;
        self.nickTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.nickTextField.placeholder = @"昵称";
        self.nickTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.nickTextField.returnKeyType = UIReturnKeyNext;
        self.nickTextField.keyboardType = UIKeyboardTypeEmailAddress;
        [self.nickTextField setTextColor:[WConfig hexStringToColor:@"#666666"]];
        self.nickTextField.backgroundColor = [WConfig hexStringToColor:@"#f4f4f4"];
        
        _passwordTextField = [UITextField new];
        self.passwordTextField.delegate = self;
        self.passwordTextField.borderStyle = UITextBorderStyleNone;
        self.passwordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.passwordTextField.keyboardType = UIKeyboardTypeEmailAddress;
        self.passwordTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 16., 45.)];
        self.passwordTextField.leftViewMode = UITextFieldViewModeAlways;
        self.passwordTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.passwordTextField.placeholder = @"密码";
        self.passwordTextField.secureTextEntry = YES;
        self.passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.passwordTextField.returnKeyType = UIReturnKeyNext;
        self.passwordTextField.keyboardType = UIKeyboardTypeEmailAddress;
        [self.passwordTextField setTextColor:[WConfig hexStringToColor:@"#666666"]];
        self.passwordTextField.backgroundColor = [WConfig hexStringToColor:@"#f4f4f4"];
        
        UIButton *loginButton = [[UIButton alloc]init];
        loginButton.layer.cornerRadius = 2;
        loginButton.layer.masksToBounds = YES;
        loginButton.backgroundColor = [WConfig hexStringToColor:@"#457ebd"];
        [loginButton setTitle:@"注册" forState:UIControlStateNormal];
        [loginButton setTitleColor: [WConfig hexStringToColor:@"#ffffff"] forState:UIControlStateNormal];
        [loginButton addTarget:self action:@selector(tapRegisterButton) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *registerButton = [[UIButton alloc]init];
        registerButton.backgroundColor = [UIColor clearColor];
        [registerButton setTitle:@"登陆" forState:UIControlStateNormal];
        [registerButton setTitleColor:[WConfig hexStringToColor:@"#dcdcdc"] forState:UIControlStateNormal];
        [WConfig setLabelWithNormalTitleStyle:registerButton.titleLabel];
        registerButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        registerButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [registerButton addTarget:self action:@selector(tapLoginButton) forControlEvents:UIControlEventTouchUpInside];
        
        UIView *superview = whiteBG;
        UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
        
        
        [whiteBG addSubview:self.nickTextField];
        [self.nickTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview.mas_top).insets(UIEdgeInsetsMake(50, 10, 10, 10));
            make.right.left.equalTo(superview).insets(padding);
            make.height.equalTo(@(50)).insets(padding);
        }];
        
        [whiteBG addSubview:self.emailTextField];
        [self.emailTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_nickTextField.mas_bottom).insets(padding);
            make.right.left.equalTo(superview).insets(padding);
            make.height.equalTo(@(50)).insets(padding);
        }];
        
        [whiteBG addSubview:self.passwordTextField];
        [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.equalTo(superview).insets(padding);
            make.top.equalTo(_emailTextField.mas_bottom).insets(padding);
            make.height.equalTo(@(50)).insets(padding);
        }];
        
        [whiteBG addSubview:loginButton];
        [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.equalTo(superview).insets(padding);
            make.top.equalTo(_passwordTextField.mas_bottom).insets(padding);
            make.height.equalTo(@(50)).insets(padding);
        }];
        
        [whiteBG addSubview:registerButton];
        [registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.equalTo(superview).insets(padding);
            make.top.equalTo(loginButton.mas_bottom).insets(padding);
            make.height.equalTo(@(30)).insets(padding);
        }];
    }
    return self;
}
#pragma mark - Selector Method

- (void)tapLoginButton
{
    NSLog(@"========tapLoginButton==========");
    
    [self dismiss];
    LoginView *view = [[LoginView alloc] init];
    [view show];
}

- (void)tapRegisterButton
{
    NSLog(@"========tapRegisterButton==========");
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
