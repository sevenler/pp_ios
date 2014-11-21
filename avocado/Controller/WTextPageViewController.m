//
//  WTextPageViewController.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-23.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WTextPageViewController.h"
#import "WConfig.h"
#import "UILabel+dynamicSized.h"

@interface WTextPageViewController ()

@end

@implementation WTextPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 300, 563)];
    [WConfig setLabelWithDescriptionStyle: label];
    label.text = self.showText;
    [label resizeToFit];

    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [WConfig hexStringToColor: @"#FFFFFF"];
    [scrollView setContentSize: label.frame.size];
    [scrollView addSubview:label];
    self.view = scrollView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
