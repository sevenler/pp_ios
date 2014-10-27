//
//  WEventModel.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-27.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WEventModel.h"

@implementation WEventModel

- (NSMutableArray *) getImages
{
    return [self.data mutableArrayValueForKey:@"image"];
}
- (NSString *) getTitle{
    return [self.data objectForKey:@"title"];
}

- (NSString *) getDescription{
    return [self.data objectForKey:@"description"];
}
- (NSInteger) getPrice{
    return 3;
}

@end
