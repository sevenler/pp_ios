//
//  WMenuViewController.m
//  Demo_Sliding_Menu
//
//  Created by johnny on 14-11-6.
//  Copyright (c) 2014年 johnny. All rights reserved.
//

#import "WMenuViewController.h"
#import "UIViewController+ECSlidingViewController.h"
#import "WHomeViewController.h"
#import "WDetailViewController.h"
#import "WViewController.h"
#import "WUserSignView.h"
#import "WEventedTapGestureRecognizer.h"
#import "WUserCenter.h"
#import "WVerifiedView.h"
#import "WUserDataViewController.h"
#import "LoginView.h"
#import "SignCodeView.h"
#import "MASConstraintMaker.h"
#import "View+MASAdditions.h"
#import "WConfig.h"

@interface WMenuViewController () <UIAlertViewDelegate>
@property (nonatomic, strong) UINavigationController *currentNavigationController;
@property (nonatomic, strong) UIView *currentSignView;
@property (nonatomic, strong) UIButton *logoutView;

@end

@implementation WMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self signInOrOut:false];
    [self initMenuItemView:self.view indexWith:0 keyWith:@"发现空间"];
    [self initMenuItemView:self.view indexWith:1 keyWith:@"我的预订"];
    
    [[WUserCenter instance] registerDataChange:self];
}

-(void)viewDidUnload {
    [super viewDidUnload];
    
    [[WUserCenter instance] unregisterDataChange:self];
}

//登陆后，显示头像  退出后，显示登陆按钮
-(void)signInOrOut:(BOOL)isSignIn{
    if(_currentSignView) [_currentSignView removeFromSuperview];
    if(_logoutView) [_logoutView removeFromSuperview];
    
    if(isSignIn) {
        WUserSignView *item1 = [[WUserSignView alloc] init];
        [item1 setFrame: CGRectMake(0, 0, 230, 180)];
        WUserModel *me = [WUserCenter instance].signedUser;
        [self setTapRecognizer:item1 dataWith:me tagWith:-1];
        [item1 setData:me];
        [self.view addSubview:item1];
        _currentSignView = item1;
        
        _logoutView = [[UIButton alloc] initWithFrame:CGRectMake(-1.f, CGRectGetHeight(self.view.frame) - 44.f, CGRectGetWidth(self.view.frame)+2, 45.f)];
        _logoutView.layer.borderColor = [WConfig hexStringToColor:@"#f1f1f1"].CGColor;
        _logoutView.layer.borderWidth = 1;
        [_logoutView setImage:[UIImage imageNamed:@"menu_icon_logout.png"] forState:UIControlStateNormal];
        [_logoutView setImage:[UIImage  imageNamed:@"menu_icon_logout.png"] forState:UIControlStateHighlighted];
        [_logoutView setTitleEdgeInsets:UIEdgeInsetsMake(0, -40,0,0)];
        [_logoutView setImageEdgeInsets:UIEdgeInsetsMake(0, -40,0,0)];
        [_logoutView setTitle:@"注销" forState:UIControlStateNormal];
        [_logoutView setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_logoutView addTarget:self action:@selector(tapLogoutButton) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_logoutView];
    }else{
        UIView *superview = [[UIView alloc] init];
        [superview setFrame: CGRectMake(0, 0, 230, 180)];
        UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
        
        UIButton *registerButton = [[UIButton alloc]init];
        registerButton.layer.cornerRadius = 2;
        registerButton.layer.masksToBounds = YES;
        registerButton.backgroundColor = [WConfig hexStringToColor:@"#457ebd"];
        [registerButton setTitle:@"登陆" forState:UIControlStateNormal];
        [registerButton setTitleColor: [WConfig hexStringToColor:@"#ffffff"] forState:UIControlStateNormal];
        [registerButton addTarget:self action:@selector(tapSignButton) forControlEvents:UIControlEventTouchUpInside];
        
        [superview addSubview:registerButton];
        [registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(superview);
            make.height.equalTo(@(40)).insets(padding);
            make.width.equalTo(@(120)).insets(padding);
        }];
        
        [self.view addSubview:superview];
        _currentSignView = superview;
    }
}

//登陆按钮click回调
- (void)tapSignButton
{
    LoginView *view = [[LoginView alloc] init];
    [view show];
}

- (void)tapLogoutButton
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"确定退出登录？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1){
        NSLog(@"You have clicked Cancel");
        [[WUserCenter instance] signOut];
    }
}

//登陆监听回调
-(void) onDataChange:(NSString *)key
           valueWith:(NSObject *)value
        oldValueWith:(NSObject *)old{
    NSLog(@" onDataChange  %@ %@ %@", key, value, old);
    
    if([kDATA_CHANGE_SIGN_IN isEqualToString:key]){
        [self signInOrOut:true];
    }else if([kDATA_CHANGE_SIGN_OUT isEqualToString:key]){
        [self signInOrOut:false];
    }
}

//初始化菜单item
- (void)initMenuItemView:(UIView *)parent
               indexWith:(NSInteger) index
                 keyWith:(NSString *)key
{
    NSInteger top = 250;
    NSInteger height = 50;
    WVerifiedView *item = [[WVerifiedView alloc] init];
    [self setTapRecognizer:item dataWith:nil tagWith:index];
    [item setFrame: CGRectMake(0, top + index * height, 320, height)];
    [item setData:key iconWith:nil];
    
    [parent addSubview:item];
}

- (IBAction)menuButtonTapped:(id)sender {
    self.slidingViewController.topViewController.view.layer.transform = CATransform3DMakeScale(1, 1, 1);
    self.slidingViewController.topViewController = [self getMenuItem:1 withSlidingVC:self.slidingViewController];
    
    [self.slidingViewController resetTopViewAnimated:YES];
}

- (IBAction)menuNavigationTapped:(id)sender {
    if ([self.slidingViewController currentTopViewPosition] == ECSlidingViewControllerTopViewPositionCentered) {
        [self.slidingViewController anchorTopViewToRightAnimated:YES];
    }else{
        [self.slidingViewController resetTopViewAnimated:YES];
    }
}

//获取菜单项目对应的ViewController
-(UINavigationController *)getMenuItem:(NSInteger)index withSlidingVC:(ECSlidingViewController *)menu{
    UIViewController *viewController = nil;
    switch(index){
        case 0:
            viewController = [[WViewController alloc] initWithNibName:@"WViewController" bundle:nil];
            break;
        case 1:
            viewController = [[WUserDataViewController alloc] initWithNibName:@"WViewController" bundle:nil];
            break;
    }
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:viewController];
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(menuNavigationTapped:)];
    [viewController.navigationItem setLeftBarButtonItem:menuItem];
    self.currentNavigationController = navigationController;
    
    //添加侧滑手势事件
    [navigationController.view addGestureRecognizer:menu.panGesture];
    
    return navigationController;
}

//区域点击事件
- (void)handleTap:(WEventedTapGestureRecognizer *)recognizer {
    switch (recognizer.redirectTag) {
        case -1:{
            [self openUser:recognizer.data isSelf:false navigationWith:self.currentNavigationController];
        }
            break;
        case 0:{
            self.slidingViewController.topViewController = [self getMenuItem:0 withSlidingVC:self.slidingViewController];
        }
            break;
        case 1:{
            self.slidingViewController.topViewController = [self getMenuItem:1 withSlidingVC:self.slidingViewController];
        }
            break;
        default:
            break;
    }
    
    [self.slidingViewController resetTopViewAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
