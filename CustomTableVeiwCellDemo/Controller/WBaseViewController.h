//
//  WBaseViewController.h
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-11-14.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WUserModel.h"
#import "WSpaceModel.h"
#import "WEventedTapGestureRecognizer.h"
#import "WAppDelegate.h"

@interface WBaseViewController : UIViewController

@property (nonatomic, assign) BOOL *slidable;//VC是否支持横向滑动打开或关闭侧边栏,默认关闭

-(void)openUser:(WUserModel *)user
         isSelf:(BOOL) value
 navigationWith:(UINavigationController *) navigation;

-(void)openSpace:(WSpaceModel *)model;

-(void) setTapRecognizer:(UIView *)view
                dataWith:(id)data
                 tagWith:(NSInteger)tag;

- (void)handleTap:(WEventedTapGestureRecognizer *)recognizer;

@end
