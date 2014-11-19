//
//  WUserDataViewController.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-11-17.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WUserDataViewController.h"
#import "WOrderCenter.h"
#import "WUserCenter.h"
#import "WOrderModel.h"
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
    WUserModel *user = [WUserCenter instance].signedUser;
    [[WOrderCenter instance] getAllOrder: [user getRemoteId]
                               blockWith:^(NSArray *objects, NSError *error) {
                                   if (!error) {
                                       NSMutableArray *list = [[NSMutableArray alloc]init];
                                       for(AVObject *obj in objects)
                                       {
                                           WOrderModel *model = [[WOrderModel alloc]initWithAVObject:obj];
                                           NSLog(@"==%@", [model getSpaceId]);
                                           [list addObject:[model getSpaceId]];
                                       }
                                       
                                       [[WProjectCenter instance] getAllSpace:list
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
                                   } else {
                                       NSLog(@"Error: %@ %@", error, [error userInfo]);
                                   }
                               }];
}

@end
