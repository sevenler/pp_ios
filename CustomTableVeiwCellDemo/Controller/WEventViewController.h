//
//  WEventViewController.h
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-29.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WViewController.h"
#import "WEventModel.h"

@interface WEventViewController : WViewController

@property (retain, nonatomic) IBOutlet UILabel *lb_title_name;
@property (retain, nonatomic) IBOutlet UILabel *lb_title_content;//标题
@property (retain, nonatomic) IBOutlet UILabel *lb_price_name;
@property (retain, nonatomic) IBOutlet UILabel *lb_price_content;//单价
@property (retain, nonatomic) IBOutlet UILabel *lb_date_name;
@property (retain, nonatomic) IBOutlet UILabel *lb_date_content;//开始时间
@property (retain, nonatomic) IBOutlet UILabel *lb_left_name;
@property (retain, nonatomic) IBOutlet UILabel *lb_left_content;//剩余名额
@property (retain, nonatomic) IBOutlet UILabel *lb_decription_name;
@property (retain, nonatomic) IBOutlet UILabel *lb_decription_content;//描述

@property (retain, nonatomic) IBOutlet UIScrollView *scrollview;

@property (strong, nonatomic) WEventModel *eventModel;

@end
