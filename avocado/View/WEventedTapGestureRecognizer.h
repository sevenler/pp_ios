//
//  WEventedTapGestureRecognizer.h
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-29.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WEventModel.h"

@interface WEventedTapGestureRecognizer : UITapGestureRecognizer

@property (strong, nonatomic) id data;
@property (assign, nonatomic) NSInteger redirectTag;

@end
