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

#define HEIGHT_SIGN_BAR 180  //菜单顶部用户模块view的高
#define MENU_WIDTH 220 //菜单的宽

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
        [item1 setFrame: CGRectMake(0, 0, 230, HEIGHT_SIGN_BAR)];
        WUserModel *me = [WUserCenter instance].signedUser;
        [self setTapRecognizer:item1 dataWith:me tagWith:-1];
        [item1 setData:me];
        [self.view addSubview:item1];
        _currentSignView = item1;
        
        _logoutView = [[UIButton alloc] initWithFrame:CGRectMake(-1.f, CGRectGetHeight(self.view.frame) - 44.f, MENU_WIDTH + 2, 45.f)];
        _logoutView.layer.borderColor = [WConfig hexStringToColor:@"#f1f1f1"].CGColor;
        _logoutView.layer.borderWidth = 1;
        [_logoutView setImage:[UIImage imageNamed:@"menu_icon_logout.png"] forState:UIControlStateNormal];
        [_logoutView setImage:[UIImage  imageNamed:@"menu_icon_logout.png"] forState:UIControlStateHighlighted];
        [_logoutView setTitle:@"注销" forState:UIControlStateNormal];
        [_logoutView setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_logoutView addTarget:self action:@selector(tapLogoutButton) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_logoutView];
        
    }else{
        UIView *superview = [[UIView alloc] init];
        [superview setFrame: CGRectMake(0, 0, 230, HEIGHT_SIGN_BAR)];
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
    [[WUserCenter instance] checkSignIn:^(WUserModel *user) {
        NSLog(@"========== sign in success ===========");
    }];
}

//退出登陆回调
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
- (void)initMenuItemView:(UIView *) parent
               indexWith:(NSInteger) index
                 keyWith:(NSString *) key
{
    NSInteger top = HEIGHT_SIGN_BAR;
    NSInteger height = 50;
    WVerifiedView *item = [[WVerifiedView alloc] init];
    [self setTapRecognizer:item dataWith:nil tagWith:index];
    [item setFrame: CGRectMake(10, top + index * height, 190, 50)];
    [item setData:key iconWith:nil];
    
    [parent addSubview:item];
}

//侧边栏菜单
- (void)menuNavigationTapped {
    if ([self.slidingViewController currentTopViewPosition] == ECSlidingViewControllerTopViewPositionCentered) {
        [self.slidingViewController anchorTopViewToRightAnimated:YES];
    }else{
        [self.slidingViewController resetTopViewAnimated:YES];
    }
}

//获取菜单项目对应的ViewController
-(UINavigationController *)getMenuItem:(NSInteger)index withSlidingVC:(ECSlidingViewController *)menu{
    WBaseViewController *viewController = nil;
    switch(index){
        case 0:
            viewController = [[WViewController alloc] initWithNibName:@"WViewController" bundle:nil];
            viewController.title = @"发现空间";
            viewController.slidable = true;
            break;
        case 1:
            viewController = [[WUserDataViewController alloc] initWithNibName:@"WViewController" bundle:nil];
            viewController.title = @"我的预订";
            viewController.slidable = true;
            break;
    }
    
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:viewController];
    //侧边栏菜单 navigation item
    UIButton *menuButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    [menuButton setImage:[UIImage imageNamed:@"button_icon_menu.png"] forState:UIControlStateNormal];
    [menuButton setImage:[UIImage imageNamed:@"button_icon_menu.png"] forState:UIControlStateHighlighted];
    [menuButton addTarget:self action:@selector(menuNavigationTapped) forControlEvents:UIControlEventTouchUpInside];
    [menuButton setContentEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
    [viewController.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc]initWithCustomView:menuButton]];
    self.currentNavigationController = navigationController;
    [navigationController.view addGestureRecognizer:menu.panGesture];//添加侧滑手势事件
    
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
            [[WUserCenter instance] checkSignIn:^(WUserModel *user) {
                self.slidingViewController.topViewController = [self getMenuItem:1 withSlidingVC:self.slidingViewController];
            }];
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
