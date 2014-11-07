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
    
    UIButton *item1 = [[UIButton alloc] init];
    [item1 setFrame: CGRectMake(30, 100, 100, 60)];
    item1.backgroundColor = [UIColor redColor];
    
    [item1 addTarget:self action:@selector(menuButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
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
//            viewController = [[WViewController alloc] initWithNibName:@"WViewController" bundle:nil];
            
            viewController = [[WHomeViewController alloc] init];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
