//
//  WPaperModel.m
//  CustomTableVeiwCellDemo
//
//  Created by wzrong on 13-8-15.
//  Copyright (c) 2013年 wzrong. All rights reserved.
//
//  试卷模型
//

#import "WSpaceModel.h"

@implementation WSpaceModel

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
- (NSInteger) getLeftDays{
    return 3;
}
- (NSInteger) getParters{
    return 2;
}
- (NSInteger) getLikers{
    NSMutableArray *likers = [self.data mutableArrayValueForKey:@"likers"];
    return likers.count;
}
- (NSString *) getAvater{
    return [self.data objectForKey:@"ownerAvater"];
}
- (NSString *) getPosition{
    return [self.data objectForKey:@"mapPositionUnit"];
}
- (NSString *) getPositionUnit{
    return [self.data objectForKey:@"mapPositionUnit"];
}

@end
