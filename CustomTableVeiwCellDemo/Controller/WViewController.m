//
//  WViewController.m
//  CustomTableVeiwCellDemo
//
//  Created by wzrong on 13-8-15.
//  Copyright (c) 2013年 wzrong. All rights reserved.
//

#import "WViewController.h"
#import "WSpaceModel.h"
#import "WProjectCell.h"
#import "WSpaceCenter.h"
#import "WDetailViewController.h"
#import <AVOSCloud/AVObject.h>

@interface WViewController (){
    
}

@end

@implementation WViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _projectList = [[NSMutableArray alloc]init];
    [self loadData];
}

-(void)loadData{
    [[WProjectCenter instance] getAllSpace: ^(NSArray *objects, NSError *error) {
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}

#pragma mark - UITableView methods
/**
 1、返回 UITableView 的区段数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

/**
 2、返回 UITableView 的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _projectList.count;
}

/**
 4、返回指定的 row 的 cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 1. cell标示符，使cell能够重用
    static NSString *paperCell = @"paperCell";
    // 2. 从TableView中获取标示符为paperCell的Cell
    WProjectCell *cell = (WProjectCell *)[tableView dequeueReusableCellWithIdentifier:paperCell];
    // 如果 cell = nil , 则表示 tableView 中没有可用的闲置cell
    if(cell == nil){
        // 3. 把 WPaperCell.xib 放入数组中
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"WProjectCell" owner:self options:nil] ;
        
        // 获取nib中的第一个对象
        for (id oneObject in nib){
            // 判断获取的对象是否为自定义cell
            if ([oneObject isKindOfClass:[WProjectCell class]]){
                // 4. 修改 cell 对象属性
                cell = [(WProjectCell *)oneObject initWithStyle:UITableViewCellStyleDefault reuseIdentifier:paperCell];
            }
        }
    }
    // 5. 设置单元格属性
    [cell setupCell:_projectList[indexPath.row]];
    return cell;
}

/**
 5、点击单元格时的处理
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WSpaceModel *paperModel = _projectList[indexPath.row];
    NSLog(@"paper year -> %@  %@", [paperModel getTitle], self.navigationController);
    
    [self openSpace:paperModel];
}

@end
