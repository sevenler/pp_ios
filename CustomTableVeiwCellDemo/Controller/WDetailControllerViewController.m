//
//  WDetailControllerViewController.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-9-21.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WDetailControllerViewController.h"
#import "WTextPageViewController.h"
#import "WConfig.h"

@interface WDetailControllerViewController (){

}
@end

@implementation WDetailControllerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

//初始化页面样式
- (void)viewInitStyle
{
    [WConfig setLabelWithTitleStyle: self.titleview];
    [WConfig setLabelWithDescriptionStyle: self.discriptionview];
    self.discriptionview.numberOfLines = 7;
    [WConfig setButtonWithDefaultStyle: self.discriptionMoreView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self viewInitStyle];
    
    self.headerview.imageURL = [NSURL URLWithString:self.projectModel.image];
    self.discriptionview.text = [NSString stringWithFormat:@"%@", self.projectModel.description];
    self.titleview.text = [NSString stringWithFormat:@"%@", self.projectModel.title];
    [self.discriptionMoreView addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    NSLog(@"paper year -> %@ ", self.projectModel.title);
}

// 点击事件
- (IBAction)buttonPress:(id)sender {
    NSLog(@"button pressed!");
    
    WTextPageViewController *textpage = [[WTextPageViewController alloc] initWithNibName:@"WTextPageViewController" bundle:nil];
    textpage.showText = self.projectModel.description;
    [self.navigationController pushViewController:textpage animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [super dealloc];
}
@end
