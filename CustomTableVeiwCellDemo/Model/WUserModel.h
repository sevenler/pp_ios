//
//  WUserModel.h
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-30.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WBaseModel.h"

extern NSString *const kVERIFIED_KEY_WEIBO;
extern NSString *const kVERIFIED_KEY_PHONE;
extern NSString *const kVERIFIED_KEY_IDENTITY_CARD;
extern NSString *const kVERIFIED_KEY_EMAIL;

@interface WUserModel : WBaseModel

- (NSString *) getAvater;
- (NSString *) getNick;
- (NSString *) getDescription;
- (NSString *) getPosition;
- (NSDate *) getRegisterDate;
- (NSString *) getWork;
- (NSString *) getSchool;

- (BOOL) getVerifiedValue:(NSString *)key;
+ (NSString *) getVerifiedName:(NSString *)key;
+ (NSString *) getVerifiedResource:(NSString *)key;

@end
