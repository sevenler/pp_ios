//
//  WProjectCenter.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-9-21.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WOrderCenter.h"
#import <AVOSCloud/AVQuery.h>

static WOrderCenter *instance = nil;

@implementation WOrderCenter

+ (WOrderCenter *)instance {
    if (!instance) {
        instance = [[super allocWithZone:NULL] init];
    }
    return instance;
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)init {
    self = [super init];
    return self;
}

- (void)getAllOrder:(NSString *)user
          blockWith:(void(^)(NSArray *objects, NSError *error))block{
    AVQuery *query = [AVQuery queryWithClassName:@"Order"];
    [query whereKey:@"customer" equalTo:user];
    [query findObjectsInBackgroundWithBlock:block];
}

@end
