//
//  WDetailViewController.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-23.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WDetailViewController.h"
#import "WTextPageViewController.h"
#import "WEventPreviewView.h"
#import "WConfig.h"
#import "WEventCenter.h"
#import "WEventModel.h"
#import "WEventViewController.h"
#import "WEventedTapGestureRecognizer.h"

#define TAG_DISCRIPTION_MORE 1

@interface WDetailViewController ()

@end

@implementation WDetailViewController

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
    self.discriptionMoreView.tag = TAG_DISCRIPTION_MORE;
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

//初始化
- (void)initEventView:(UIScrollView *)parent
            indexWith:(NSInteger) index
             dataWith:(WEventModel *)event
{
    NSInteger top = 900;
    NSInteger height = 120;
    WEventPreviewView *item = [[WEventPreviewView alloc] init];
    [item setFrame: CGRectMake(0, top + index * height, 320, height)];
    [item setData:[event getImages][0] titleWith:[event getTitle] priceWith: (long)[event getPrice]];
    
    WEventedTapGestureRecognizer *singleFingerTap = [[WEventedTapGestureRecognizer alloc] initWithTarget:self
                                                                                      action:@selector(handleTap:)];
    singleFingerTap.eventModel = event;
    [item addGestureRecognizer:singleFingerTap];
    [singleFingerTap release];

    [parent addSubview:item];
}

//区域点击事件
- (void)handleTap:(WEventedTapGestureRecognizer *)recognizer {
    WEventViewController *detail = [[WEventViewController alloc] init];
    detail.eventModel = recognizer.eventModel;
    [self.navigationController pushViewController:detail animated:YES];
}

//按钮点击事件
- (IBAction)buttonPress:(id)sender {
    UIView *view = sender;
    
    switch (view.tag) {
        case TAG_DISCRIPTION_MORE:{
            WTextPageViewController *textpage = [[WTextPageViewController alloc] init];
            textpage.showText = [self.projectModel getDescription];
            [self.navigationController pushViewController:textpage animated:YES];
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
