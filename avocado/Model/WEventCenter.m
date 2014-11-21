//
//  WProjectCenter.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-9-21.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WEventCenter.h"
#import <AVOSCloud/AVQuery.h>

static WEventCenter *instance = nil;

@implementation WEventCenter

+ (WEventCenter *)instance {
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

- (void)getAllEvent:(NSString *)spaceId
          blockWith:(void(^)(NSArray *objects, NSError *error))block {
    AVQuery *query = [AVQuery queryWithClassName:@"Event"];
    [query whereKey:@"spaceId" equalTo:spaceId];
    [query findObjectsInBackgroundWithBlock:block];
}

@end
