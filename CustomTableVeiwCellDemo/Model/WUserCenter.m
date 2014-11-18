//
//  WProjectCenter.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-9-21.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WUserCenter.h"
#import <AVOSCloud/AVQuery.h>
#import <AVOSCloud/AVUser.h>

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

- (void)signIn:(NSString *)user
passwordWith:(NSString *)password
      blockWith:(void(^)(AVUser *user, NSError *error))block {
    [AVUser logInWithUsernameInBackground:user password:password block:^(AVUser *object, NSError *error) {
        if (!error) {
            block(object, error);
            [self onDataChange:kDATA_CHANGE_SIGN_IN valueWith:nil oldValueWith:nil];
        } else {
            block(object, error);
        }
    }];
}

@end
