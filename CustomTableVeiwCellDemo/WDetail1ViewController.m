//
//  WDetail1ViewController.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-23.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WDetail1ViewController.h"
#import "WTextPageViewController.h"
#import "MASExampleAttributeChainingView.h"
#import "WConfig.h"

@interface WDetail1ViewController ()

@end

@implementation WDetail1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.scrollview setContentSize:CGSizeMake(320, 1800)];
}


//初始化页面样式
- (void)viewInitStyle
{
    //修改样式
    [WConfig setLabelWithBigTitleStyle: self.titleview];
    [WConfig setLabelWithDescriptionStyle: self.discriptionview];
    self.discriptionview.numberOfLines = 7;
    [WConfig setButtonWithDefaultStyle: self.discriptionMoreView];
    [WConfig setLabelWithNormalTitleStyle: self.eventTitle];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self viewInitStyle];
    
    [self initEventView: self.scrollview];
    
    self.discriptionview.text = [NSString stringWithFormat:@"%@", [self.projectModel getDescription]];
    self.titleview.text = [NSString stringWithFormat:@"%@", [self.projectModel getTitle]];
    [self.discriptionMoreView addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    NSMutableArray *images = [self.projectModel getImages];
    self.headerview.imageURL = [NSURL URLWithString:images[0]];
    self.image0.imageURL = [NSURL URLWithString:images[1]];
    self.image1.imageURL = [NSURL URLWithString:images[2]];
    
    self.eventTitle.text = @"可预订的活动";
}

- (void)initEventView:(UIScrollView *)parent
{
    MASExampleAttributeChainingView *item = [[MASExampleAttributeChainingView alloc] init];
    [item setFrame: CGRectMake(0, 1000, 320, 120)];
    [item setBackgroundColor: [WConfig hexStringToColor:@"e2e2e2"]];
    [item setData: @"http://ac-6aysjxli.qiniudn.com/QIMXCQGyuYrFjPr6UwUhmvrgu2AcuU8f3gzxi1Ou.png" titleWith:[self.projectModel getTitle] descriptionWith:[self.projectModel getTitle] ];
    
    [parent addSubview:item];
}

- (IBAction)buttonPress:(id)sender {
    NSLog(@"button pressed!");
    
    WTextPageViewController *textpage = [[WTextPageViewController alloc] init];
    textpage.showText = [self.projectModel getDescription];
    [self.navigationController pushViewController:textpage animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
