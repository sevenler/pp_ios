//
//  WProjectCenter.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-9-21.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WSpaceCenter.h"
#import <AVOSCloud/AVQuery.h>

static WProjectCenter *instance = nil;

@implementation WProjectCenter

+ (WProjectCenter *)instance {
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

- (void)getAllSpace:(void(^)(NSArray *objects, NSError *error))block {
    AVQuery *query = [AVQuery queryWithClassName:@"Space"];
    [query orderByDescending:@"createdAt"];
    [query findObjectsInBackgroundWithBlock:block];
}



@end
