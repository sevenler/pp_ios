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

@interface WMenuViewController ()

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
    
    WUserSignView *item1 = [[WUserSignView alloc] init];
    [item1 setFrame: CGRectMake(0, 0, 230, 180)];
    [self setTapRecognizer:item1 dataWith:nil tagWith:0];
    
    [[WUserCenter instance] getUser:@"18511557126"
                          blockWith:^(NSArray *objects, NSError *error) {
                              if (!error) {
                                  NSInteger count = (objects.count > 1 ? 1 : objects.count);
                                  for (int i = 0; i < count; i++) {
                                      WUserModel *user = [[WUserModel alloc]initWithAVObject:objects[i]];
                                      NSLog(@"get user: %@", [user getNick]);
                                      
                                      [item1 setData:user];
                                  }
                              } else {
                                  NSLog(@"Error: %@ %@", error, [error userInfo]);
                              }
                          }];
    
    [self.view addSubview:item1];
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

-(UINavigationController *)getMenuItem:(NSInteger)index withSlidingVC:(ECSlidingViewController *)menu{
    UIViewController *viewController = nil;
    switch(index){
        case 0:
            viewController = [[WViewController alloc] initWithNibName:@"WViewController" bundle:nil];
            break;
        case 1:
            viewController = [[WHomeViewController alloc] init];
            break;
    }
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:viewController];
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(menuNavigationTapped:)];
    [viewController.navigationItem setLeftBarButtonItem:menuItem];
    
    //添加侧滑手势事件
    [navigationController.view addGestureRecognizer:menu.panGesture];
    
    return navigationController;
}

//添加 tap事件
-(void) setTapRecognizer:(UIView *)view
                dataWith:(id)data
                 tagWith:(NSInteger)tag{
    WEventedTapGestureRecognizer *singleFingerTap = [[WEventedTapGestureRecognizer alloc] initWithTarget:self
                                                                                                  action:@selector(handleTap:)];
    singleFingerTap.redirectTag = tag;
    singleFingerTap.data = data;
    [view addGestureRecognizer:singleFingerTap];
    [singleFingerTap release];
}

//区域点击事件
- (void)handleTap:(WEventedTapGestureRecognizer *)recognizer {
    switch (recognizer.redirectTag) {
        case 0:{
            NSLog(@"+------------- ");
        }
            break;
        case 2:{
            
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
