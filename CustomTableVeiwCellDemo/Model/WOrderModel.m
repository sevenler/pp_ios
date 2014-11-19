//
//  WPaperModel.m
//  CustomTableVeiwCellDemo
//
//  Created by wzrong on 13-8-15.
//  Copyright (c) 2013年 wzrong. All rights reserved.
//
//  试卷模型
//

#import "WOrderModel.h"

@implementation WOrderModel

- (NSInteger) getStatus{
    return [self.data objectForKey:@"status"];
}
- (NSString *) getSpaceId{
    return [self.data objectForKey:@"spaceId"];
}
- (NSString *) getCustomer{
    return [self.data objectForKey:@"customer"];
}

- (NSString *) description{
    return [NSString stringWithFormat: @"spaceId=%@ customer=%@", [self getSpaceId], [self getCustomer]];;
}

@end
