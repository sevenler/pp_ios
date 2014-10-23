//
//  WPaperCell.h
//  CustomTableVeiwCellDemo
//
//  Created by wzrong on 13-8-15.
//  Copyright (c) 2013年 wzrong. All rights reserved.
//
//  自定义UITableViewCell
//  

#import <UIKit/UIKit.h>
#import "WSpaceModel.h"
#import "EGOImageView.h"

@interface WProjectCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *lblTitle;        // 标题
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;    // 剩余天数
@property (strong, nonatomic) IBOutlet EGOImageView *imgThumb;//图片
@property (strong, nonatomic) IBOutlet EGOImageView *imgAvater;//发起人头像

/**
 设置Cell
 */
-(void)setupCell:(WSpaceModel *)model;

@end
