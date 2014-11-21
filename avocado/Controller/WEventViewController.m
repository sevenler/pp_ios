//
//  WEventViewController.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-29.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WEventViewController.h"
#import "WConfig.h"
#import "WUtils.h"
#import "UIImageView+WebCache.h"
#import "View+MASAdditions.h"
#import "WConfigView.h"

@interface WEventViewController ()

@property (retain, nonatomic) WConfigView *config_title;
@property (retain, nonatomic) WConfigView *config_price;
@property (retain, nonatomic) WConfigView *config_date;
@property (retain, nonatomic) WConfigView *config_left;

@property (retain, nonatomic)  UILabel *lb_decription_name;
@property (retain, nonatomic)  UILabel *lb_decription_content;//描述

@property (retain, nonatomic) IBOutlet UIScrollView *scrollview;
@end

@implementation WEventViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self resetScrollViewContent];
}

- (void)viewDidLayoutSubviews {
    //没有这句话，自动布局将导致在ios7下scrollview不能滚动。
    [self resetScrollViewContent];
}

- (void)resetScrollViewContent {
    [_scrollview setContentSize:CGSizeMake(320, 1700)];
}

//初始化页面样式
- (void)viewInitStyle
{
    _scrollview = [[UIScrollView alloc] init];
    _scrollview.backgroundColor = [UIColor whiteColor];
    
    _lb_decription_name = [[UILabel alloc] init];
    _lb_decription_content = [[UILabel alloc] init];
    
    [self.view addSubview:_scrollview];
    
    UIView *superview = _scrollview;
    NSInteger paddingValue = 10;
    UIEdgeInsets padding = UIEdgeInsetsMake(0, paddingValue, 0, paddingValue);
    NSInteger screenWidth = 320;
    [_scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    NSInteger height = 50;
    NSInteger top = 0;
    
    _config_title = [[WConfigView alloc] init];
    [_config_title setFrame: CGRectMake(10, top + 0 * height, 300, height)];
    _config_price = [[WConfigView alloc] init];
    [_config_price setFrame: CGRectMake(10, top + 1 * height, 300, height)];
    _config_date = [[WConfigView alloc] init];
    [_config_date setFrame: CGRectMake(10, top + 2 * height, 300, height)];
    _config_left = [[WConfigView alloc] init];
    [_config_left setFrame: CGRectMake(10, top + 3 * height, 300, height)];
    
    [_scrollview addSubview:_config_title];
    [_scrollview addSubview:_config_price];
    [_scrollview addSubview:_config_date];
    [_scrollview addSubview:_config_left];
    
    [_scrollview addSubview:_lb_decription_name];
    [_scrollview addSubview:_lb_decription_content];
    
    [_lb_decription_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superview).insets(padding);
        make.top.equalTo(@(top + 4 * height));
        make.width.equalTo(@(screenWidth - paddingValue * 2));
        make.height.equalTo(@(40));
    }];
    [_lb_decription_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superview).insets(padding);
        make.top.equalTo(_lb_decription_name.mas_bottom);
        make.width.equalTo(@(screenWidth - paddingValue * 2));
        make.height.equalTo(@(100));
    }];
    
    [WConfig setLabelWithBigTitleStyle: self.lb_decription_name];
    self.lb_decription_name.textAlignment = NSTextAlignmentCenter;
    [WConfig setLabelWithBigTitleStyle: self.lb_decription_content];
    self.lb_decription_content.numberOfLines = 30;
}

-(void) addImages
{
    NSInteger top = 400;
    NSInteger height = 200;
    NSMutableArray *images = [self.eventModel getImages];
    NSInteger index = 0;
    NSInteger margin = 10;
    for(NSString *img in images)
    {
        UIImageView *image = [[UIImageView alloc] init];
        [image setFrame: CGRectMake(10, top + (index++ * (height + margin)), 300, height)];
        [image setImageWithURL:[NSURL URLWithString:img]];
        [self.scrollview addSubview:image];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self viewInitStyle];
    
    [_config_title setData:@"标题" valueWith:[self.eventModel getTitle]];
    [_config_price setData:@"单价" valueWith:[NSString stringWithFormat:@"%ld/人", (long)[self.eventModel getPrice]]];
    [_config_date setData:@"开始时间" valueWith:[WUtils formatDate:[self.eventModel getTargetDate] withFromat:@"yyyy-MM-dd"]];
    [_config_left setData:@"剩余名额" valueWith:[NSString stringWithFormat:@"%ld位", (long)([self.eventModel getTargetMax] - [self.eventModel getPartners])]];
    
    [_lb_decription_name setText: @"详情"];
    [_lb_decription_content setText: [self.eventModel getDescription]];
    [_lb_decription_content resizeToFit];
    
    [self addImages];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
