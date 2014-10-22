//
//  WDetailControllerViewController.h
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-9-21.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSpaceModel.h"
#import "EGOImageView.h"

@interface WDetailControllerViewController : UIViewController
@property (retain, nonatomic) IBOutlet EGOImageView *headerview;
@property (retain, nonatomic) IBOutlet UILabel *titleview;
@property (retain, nonatomic) IBOutlet UILabel *discriptionview;

@property (strong, nonatomic) WProjectModel *projectModel;



@end
