//
//  WProjectCenter.h
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-9-21.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVUser.h>
#import "WBaseModel.h"
#import "WUserModel.h"

@interface WUserCenter : WBaseModel

@property (strong, nonatomic) WUserModel *signedUser;

+(WUserCenter *) instance;

- (void)getUser:(NSString *)userId
      blockWith:(void(^)(NSArray *objects, NSError *error))block;

- (void)signIn:(NSString *)user
  passwordWith:(NSString *)password
     blockWith:(void(^)(AVUser *user, NSError *error))block;
@end