//
//  WUserModel.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-30.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WUserModel.h"

@implementation WUserModel

- (NSString *) getAvater;
{
    return [self.data objectForKey:@"avater"];
}
- (NSString *) getNick{
    return [self.data objectForKey:@"nick"];
}
- (NSString *) getDescription{
    return [self.data objectForKey:@"description"];
}
- (NSString *) getPosition{
    return [self.data objectForKey:@"postion"];
}

@end
