//
//  WUserViewController.h
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-30.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WUserModel.h"
#import "WBaseViewController.h"

@interface WUserViewController : WBaseViewController<DataDelegate>

@property (strong, nonatomic) WUserModel *userModel;

@end
