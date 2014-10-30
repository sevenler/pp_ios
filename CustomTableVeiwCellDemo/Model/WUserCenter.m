//
//  WProjectCenter.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-9-21.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WUserCenter.h"
#import <AVOSCloud/AVQuery.h>

static WUserCenter *instance = nil;

@implementation WUserCenter

+ (WUserCenter *)instance {
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

- (void)getUser:(NSString *)userId
      blockWith:(void(^)(NSArray *objects, NSError *error))block {
    AVQuery *query = [AVQuery queryWithClassName:@"_User"];
    [query whereKey:@"username" equalTo:userId];
    [query findObjectsInBackgroundWithBlock:block];
}

@end
