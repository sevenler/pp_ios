//
//  WDetail1ViewController.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-23.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WDetail1ViewController.h"
#import "WTextPageViewController.h"
#import "WEventPreviewView.h"
#import "WConfig.h"
#import "WEventCenter.h"
#import "WEventModel.h"

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
    
    self.discriptionview.text = [NSString stringWithFormat:@"%@", [self.projectModel getDescription]];
    self.titleview.text = [NSString stringWithFormat:@"%@", [self.projectModel getTitle]];
    [self.discriptionMoreView addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    NSMutableArray *images = [self.projectModel getImages];
    self.headerview.imageURL = [NSURL URLWithString:images[0]];
    self.image0.imageURL = [NSURL URLWithString:images[1]];
    self.image1.imageURL = [NSURL URLWithString:images[2]];
    
    self.eventTitle.text = @"可预订的活动";
    //添加活动列表
    [[WEventCenter instance] getAllEvent:[self.projectModel getRemoteId]
                               blockWith:^(NSArray *objects, NSError *error) {
                                   if (!error) {
                                       NSInteger index = 0;
                                       for(AVObject *obj in objects)
                                       {
                                           WEventModel *event = [[WEventModel alloc]initWithAVObject:obj];
                                           [self initEventView: self.scrollview indexWith:index++ dataWith:event];
                                       }
                                   } else {
                                       NSLog(@"Error: %@ %@", error, [error userInfo]);
                                   }
                               }];
}

- (void)initEventView:(UIScrollView *)parent
            indexWith:(NSInteger) index
             dataWith:(WEventModel *)event
{
    NSInteger top = 900;
    NSInteger height = 120;
    WEventPreviewView *item = [[WEventPreviewView alloc] init];
    [item setFrame: CGRectMake(0, top + index * height, 320, height)];
    [item setData:[event getImages][0] titleWith:[event getTitle] priceWith: (long)[event getPrice]];
    
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
