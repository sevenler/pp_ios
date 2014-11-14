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

@interface WBaseViewController : UIViewController

-(void)openUser:(WUserModel *)user
         isSelf:(BOOL) value
 navigationWith:(UINavigationController *) navigation;

-(void)openSpace:(WSpaceModel *)model;

-(void) setTapRecognizer:(UIView *)view
                dataWith:(id)data
                 tagWith:(NSInteger)tag;

- (void)handleTap:(WEventedTapGestureRecognizer *)recognizer;
@end
