//
//  WDetail1ViewController.h
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-23.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"
#import "FlatPillButton.h"
#import "WSpaceModel.h"

@interface WDetail1ViewController : UIViewController

@property (retain, nonatomic) IBOutlet  EGOImageView *headerview;
@property (retain, nonatomic) IBOutlet EGOImageView *image0;
@property (retain, nonatomic) IBOutlet EGOImageView *image1;

@property (retain, nonatomic) IBOutlet UILabel *titleview;
@property (retain, nonatomic) IBOutlet UILabel *discriptionview;
@property (retain, nonatomic) IBOutlet FlatPillButton *discriptionMoreView;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollview;

@property (retain, nonatomic) IBOutlet UILabel *eventTitle;

@property (strong, nonatomic) WSpaceModel *projectModel;

@end
