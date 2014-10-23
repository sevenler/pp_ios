//
//  WBaseModel.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-23.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WBaseModel.h"

@implementation WBaseModel

-(id)initWithAVObject:(AVObject *)data{
    self = [super init];
    self.data = data;
    return self;
}

@end
