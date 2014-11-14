//
//  WBaseViewController.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-11-14.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WBaseViewController.h"
#import "WUserViewController.h"
#import "WDetailViewController.h"
#import "WEventedTapGestureRecognizer.h"

@interface WBaseViewController ()

@end

@implementation WBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)openUser:(WUserModel *)user
         isSelf:(BOOL) value
 navigationWith:(UINavigationController *) navigation
{
    WUserViewController *userDetail = [[WUserViewController alloc] init];
    userDetail.userModel = user;
    [navigation pushViewController:userDetail animated:YES];
}

-(void)openSpace:(WSpaceModel *)model
{
    WDetailViewController *detail = [[WDetailViewController alloc] initWithNibName:@"WDetailViewController" bundle:nil];
    detail.projectModel = model;
    [self.navigationController pushViewController:detail animated:YES];
    [detail release];
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

- (void)handleTap:(WEventedTapGestureRecognizer *)recognizer{
    
}
@end
