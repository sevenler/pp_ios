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
#import "WUserModel.h"
#import "LoginView.h"

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

//请求用户信息
- (void)getUser:(NSString *)userId
      blockWith:(void(^)(NSArray *objects, NSError *error))block {
    AVQuery *query = [AVQuery queryWithClassName:@"_User"];
    [query whereKey:@"username" equalTo:userId];
    [query findObjectsInBackgroundWithBlock:block];
}

//登陆
- (void)signIn:(NSString *)user
passwordWith:(NSString *)password
      blockWith:(void(^)(AVUser *user, NSError *error))block {
    [AVUser logInWithUsernameInBackground:user password:password block:^(AVUser *object, NSError *error) {
        if (!error) {
            block(object, error);
            _signedUser = [self parseUser:object];
            NSLog(@" sign in user:  %@",[_signedUser description]);
            [self onDataChange:kDATA_CHANGE_SIGN_IN valueWith:nil oldValueWith:nil];
        } else {
            block(object, error);
        }
    }];
}

//退出登陆
- (void)signOut{
    [self onDataChange:kDATA_CHANGE_SIGN_OUT valueWith:nil oldValueWith:_signedUser];
    _signedUser = nil;
}

- (WUserModel *)parseUser:(AVUser *)data{
    WUserModel *user = [[WUserModel alloc]initWithAVObject:data];
    return user;
}


//check请求登陆
//这个地方的逻辑：
//1.判断是否登陆
//2.如果登陆，则执行block
//3.如果未登陆，则调用登陆UI
//TODO 那么未登陆的状态的时候，调用登陆UI，执行登陆后，block是不会执行的。体验不好。
//后期有时间建议优化。可以将block存储起来。当signIn执行成功后，回调block
//NOTICE 建议所有的需要登陆后才能操作的行为都采用这个方法包起来。这样的话，block和之后的操作就可以操作登陆后的user了。
- (void)checkSignIn:(void(^)(WUserModel *user))block {
    if (_signedUser) {
        block(_signedUser);
    }else{
        LoginView *view = [[LoginView alloc] init];
        [view show];
    }
}

@end
