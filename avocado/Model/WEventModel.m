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
    return [self.data objectForKey:@"descript"];
}
- (NSInteger) getPrice{
    return 3;
}
- (NSDate *) getTargetDate{
    return [self.data objectForKey:@"targetDate"];
}
- (NSInteger) getTargetMax{
    return [[self.data objectForKey:@"targetMax"] integerValue];
}
- (NSInteger) getPartners
{
    return [[self.data objectForKey:@"partners"] integerValue];
}

@end
