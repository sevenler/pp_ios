//
//  WUserViewController.h
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-30.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WUserModel.h"
#import "EGOImageView.h"

@interface WUserViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIScrollView *scrollview;
@property (retain, nonatomic) IBOutlet EGOImageView *image_avater;
@property (retain, nonatomic) IBOutlet UILabel *lb_nick_content;
@property (retain, nonatomic) IBOutlet UILabel *lb_position_content;
@property (retain, nonatomic) IBOutlet UILabel *lb_register_date_content;
@property (retain, nonatomic) IBOutlet UILabel *lb_description_name;
@property (retain, nonatomic) IBOutlet UILabel *lb_description_content;

@property (retain, nonatomic) IBOutlet UILabel *lb_work_name;
@property (retain, nonatomic) IBOutlet UILabel *lb_work_content;
@property (retain, nonatomic) IBOutlet UILabel *lb_school_name;
@property (retain, nonatomic) IBOutlet UILabel *lb_school_content;

@property (retain, nonatomic) IBOutlet UILabel *lb_verified_name;

@property (strong, nonatomic) WUserModel *userModel;

@end
