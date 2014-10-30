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
#import "EGOImageView.h"

@interface WEventViewController ()

@end

@implementation WEventViewController

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
    //修改样式
    [self setTitleStyle: self.lb_title_name];
    [self setTitleStyle: self.lb_price_name];
    [self setTitleStyle: self.lb_date_name];
    [self setTitleStyle: self.lb_left_name];
    
    [self setContentStyle: self.lb_title_content];
    [self setContentStyle: self.lb_price_content];
    [self setContentStyle: self.lb_date_content];
    [self setContentStyle: self.lb_left_content];
    
    [self setTitleStyle: self.lb_decription_name];
    self.lb_decription_name.textAlignment = UITextAlignmentCenter;
    [self setContentStyle: self.lb_decription_content];
    self.lb_decription_content.numberOfLines = 30;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.scrollview setContentSize:CGSizeMake(320, 1700)];
}

- (void) setTitleStyle:(UILabel *)label
{
    [WConfig setLabelWithBigTitleStyle: label];
    label.textAlignment = UITextAlignmentLeft;
}

- (void) setContentStyle:(UILabel *)label
{
    [WConfig setLabelWithBigTitleStyle: label];
    label.textAlignment = UITextAlignmentRight;
}

-(void) addImages
{
    NSInteger top = 550;
    NSInteger height = 200;
    NSMutableArray *images = [self.eventModel getImages];
    NSInteger index = 0;
    for(NSString *img in images)
    {
        EGOImageView *image = [[EGOImageView alloc] init];
        [image setFrame: CGRectMake(0, top + (index++ * height), 320, height)];
        image.imageURL = [NSURL URLWithString:img];
        [self.scrollview addSubview:image];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self viewInitStyle];
    
    [self.lb_title_name setText: @"标题"];
    [self.lb_price_name setText: @"单价"];
    [self.lb_date_name setText: @"开始时间"];
    [self.lb_left_name setText: @"剩余名额"];
    [self.lb_decription_name setText: @"详情"];
    
    [self.lb_title_content setText: [self.eventModel getTitle]];
    [self.lb_price_content setText: [NSString stringWithFormat:@"%ld/人", (long)[self.eventModel getPrice]]];
    [self.lb_date_content setText:[WUtils formatDate:[self.eventModel getTargetDate] withFromat:@"yyyy-MM-dd"]];
    [self.lb_left_content setText: [NSString stringWithFormat:@"%ld位", (long)([self.eventModel getTargetMax] - [self.eventModel getPartners])]];
    [self.lb_decription_content setText: [self.eventModel getDescription]];
    [self.lb_decription_content resizeToFit];
    
    [self addImages];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
