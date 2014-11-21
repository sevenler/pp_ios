//
//  WViewController.h
//  CustomTableVeiwCellDemo
//
//  Created by wzrong on 13-8-15.
//  Copyright (c) 2013年 wzrong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBaseViewController.h"

@interface WViewController : WBaseViewController<UITableViewDataSource, UITableViewDelegate>{
    NSMutableArray *_projectList; // 项目列表
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end
