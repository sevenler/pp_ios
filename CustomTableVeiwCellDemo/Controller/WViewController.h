//
//  WViewController.h
//  CustomTableVeiwCellDemo
//
//  Created by wzrong on 13-8-15.
//  Copyright (c) 2013年 wzrong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
