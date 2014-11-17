//
//  WUserDataViewController.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-11-17.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WUserDataViewController.h"
#import "WSpaceCenter.h"

@interface WUserDataViewController ()

@end

@implementation WUserDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)loadData{
    [[WProjectCenter instance] getAllSpace: @"18511557126"
                                 blockWith:^(NSArray *objects, NSError *error) {
                                     if (!error) {
                                         for(AVObject *obj in objects)
                                         {
                                             WSpaceModel *paperModel = [[WSpaceModel alloc]initWithAVObject:obj];
                                             [_projectList addObject:paperModel];
                                         }
                                         [self.tableView reloadData];
                                     } else {
                                         NSLog(@"Error: %@ %@", error, [error userInfo]);
                                     }
                                 }];
}

@end
