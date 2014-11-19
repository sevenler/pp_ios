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
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;
@end

@implementation WBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _slidable = false;//默认关闭
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //由于侧边栏的手势原因。如果不支持侧边栏滑动，在vc的view中添加手势来拦截滑动
    if(!_slidable) [self.view addGestureRecognizer:[self panGesture]];
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

//滑动手势
- (UIPanGestureRecognizer *)panGesture {
    if (_panGesture) return _panGesture;
    _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(detectPanGestureRecognizer:)];
    return _panGesture;
}

//滑动手势回调
- (void)detectPanGestureRecognizer:(UIPanGestureRecognizer *)recognizer {
    NSLog(@" invoked BaseViewController's detectPanGestureRecognizer ");
}
@end
