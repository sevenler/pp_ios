//
//  WMenuViewController.h
//  Demo_Sliding_Menu
//
//  Created by johnny on 14-11-6.
//  Copyright (c) 2014年 johnny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "WBaseViewController.h"

@interface WMenuViewController : WBaseViewController<DataDelegate>

-(UINavigationController *)getMenuItem:(NSInteger)index withSlidingVC:(ECSlidingViewController *)menu;

@end
