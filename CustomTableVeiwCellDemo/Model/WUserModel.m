//
//  WUserModel.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-30.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WUserModel.h"

NSString *const kVERIFIED_KEY_WEIBO = @"sinaWeiboVerified";
NSString *const kVERIFIED_KEY_PHONE = @"mobilephoneVerified";
NSString *const kVERIFIED_KEY_IDENTITY_CARD = @"identityCardVerified";
NSString *const kVERIFIED_KEY_EMAIL = @"emailVerified";

@implementation WUserModel

- (NSString *) getUserName{
    return [self.data objectForKey:@"username"];
}

- (NSString *) getAvater;
{
    return [self.data objectForKey:@"avater"];
}
- (NSString *) getNick{
    return [self.data objectForKey:@"nick"];
}
- (NSString *) getDescription{
    return [self.data objectForKey:@"description"];
}
- (NSString *) getPosition{
    return [self.data objectForKey:@"postion"];
}
- (NSDate *) getRegisterDate{
    return [self.data objectForKey:@"createdAt"];
}
- (NSString *) getWork{
    return [self.data objectForKey:@"work"];
}
- (NSString *) getSchool{
    return [self.data objectForKey:@"school"];
}
- (BOOL) getVerifiedValue:(NSString *)key{
    return [[self.data objectForKey:key] boolValue];
}
+ (NSString *) getVerifiedName:(NSString *)key{
    if([kVERIFIED_KEY_PHONE isEqualToString:key] ){
        return @"手机号码";
    }else if([kVERIFIED_KEY_EMAIL isEqualToString:key]){
        return @"电子邮件";
    }else if([kVERIFIED_KEY_IDENTITY_CARD isEqualToString:key]){
        return @"身份证";
    }else if([kVERIFIED_KEY_WEIBO isEqualToString:key]){
        return @"新浪微博";
    }
    return @"";
}
+ (NSString *) getVerifiedResource:(NSString *)key{
    if([kVERIFIED_KEY_PHONE isEqualToString:key] ){
        return @"icon_verified_phone.png";
    }else if([kVERIFIED_KEY_EMAIL isEqualToString:key]){
        return @"icon_verified_email.png";
    }else if([kVERIFIED_KEY_IDENTITY_CARD isEqualToString:key]){
        return @"icon_verified_identity_card.png";
    }else if([kVERIFIED_KEY_WEIBO isEqualToString:key]){
        return @"icon_verified_sina_weibo.png";
    }
    return @"";
}

- (NSString *) description{
    return [NSString stringWithFormat: @"rid=%@ username=%@ nick=%@ description=%@ work=%@", [self getRemoteId], [self getUserName], [self getNick], [self getDescription], [self getWork]];;
}
@end
