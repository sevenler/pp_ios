//
//  WDetailViewController.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-23.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WDetailViewController.h"
#import "WConfig.H"
#import "WTextPageViewController.h"

@interface WDetailViewController ()

@property (retain, nonatomic)  EGOImageView *headerview;
@property (retain, nonatomic)  EGOImageView *image0;
@property (retain, nonatomic)  EGOImageView *image1;

@property (retain, nonatomic)  UILabel *titleview;
@property (retain, nonatomic)  UILabel *discriptionview;
@property (retain, nonatomic)  FlatPillButton *discriptionMoreView;
@property (retain, nonatomic)  UIScrollView *scrollview;

@end

@implementation WDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

//初始化页面样式
- (void)viewInitStyle
{
    //初始化控件，这个过程本来应该在xib中实现的，但是xib用起来各种问题。
    self.headerview = [[EGOImageView alloc] initWithFrame: CGRectMake(0, 0, 320, 200)];
    self.titleview = [[UILabel alloc] initWithFrame: CGRectMake(0, 200, 320, 60)];
    self.discriptionview = [[UILabel alloc] initWithFrame: CGRectMake(0, 260, 320, 150)];
    self.discriptionMoreView = [[FlatPillButton alloc] initWithFrame: CGRectMake(0, 410, 100, 50)];
    
    self.scrollview = [[UIScrollView alloc] initWithFrame: CGRectMake(0, 0, 320, 568)];
    self.scrollview.backgroundColor = [WConfig hexStringToColor: @"#FFFFFF"];
    [self.scrollview addSubview:self.headerview];
    [self.scrollview addSubview:self.titleview];
    [self.scrollview addSubview:self.discriptionview];
    [self.scrollview addSubview:self.discriptionMoreView];
    
    
    
    self.image0 = [[EGOImageView alloc] initWithFrame:CGRectMake(0,526, 320, 200)];
    self.image1 = [[EGOImageView alloc] initWithFrame:CGRectMake(0,726, 320, 200)];
    [self.scrollview addSubview:self.image0];
    [self.scrollview addSubview:self.image1];
    
    [self.scrollview setContentSize:(CGSizeMake(320, 926))];
    self.view = self.scrollview;
    
    //修改样式
    [WConfig setLabelWithTitleStyle: self.titleview];
    [WConfig setLabelWithDescriptionStyle: self.discriptionview];
    self.discriptionview.numberOfLines = 7;
    [WConfig setButtonWithDefaultStyle: self.discriptionMoreView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self viewInitStyle];
    
    self.discriptionview.text = [NSString stringWithFormat:@"%@", self.projectModel.description];
    self.titleview.text = [NSString stringWithFormat:@"%@", self.projectModel.title];
    [self.discriptionMoreView addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    self.headerview.imageURL = [NSURL URLWithString:self.projectModel.image];
    self.image0.imageURL = [NSURL URLWithString:self.projectModel.image];
    self.image1.imageURL = [NSURL URLWithString:self.projectModel.image];
}

- (IBAction)buttonPress:(id)sender {
    NSLog(@"button pressed!");
    
    WTextPageViewController *textpage = [[WTextPageViewController alloc] init];
    textpage.showText = self.projectModel.description;
    [self.navigationController pushViewController:textpage animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
