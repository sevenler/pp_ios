//
//  WTextPageViewController.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-23.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WTextPageViewController.h"
#import "WConfig.h"

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
    
    [WConfig setLabelWithDescriptionStyle: self.textview];
    self.textview.numberOfLines = 0;
    [self.textview sizeToFit];
    self.textview.text = [NSString stringWithFormat:@"%@", self.showText];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
