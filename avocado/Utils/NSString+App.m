//
//  NSString+App.m
//  Blueberry
//
//  Created by 魏哲 on 13-10-12.
//  Copyright (c) 2013年 GuoKu. All rights reserved.
//

#import "NSString+App.h"
#import <CommonCrypto/CommonDigest.h>

BOOL isNumber (char ch);

BOOL isNumber (char ch)
{
    if (!(ch >= '0' && ch <= '9')) {
        return FALSE;
    }
    return TRUE;
}

@implementation NSString (App)

- (NSString *)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0],  result[1],  result[2],  result[3],
            result[4],  result[5],  result[6],  result[7],
            result[8],  result[9],  result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];  
}

- (NSString *)encodedUrl
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)self,NULL,CFSTR("!*'();:@&=+$,/?%#[]"),kCFStringEncodingUTF8));
    return result;
}

- (BOOL)isValidEmail
{
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^[\\w\\+\\-_.]+@[\\w_-]+(\\.[\\w_-]+)+$" options:NSRegularExpressionCaseInsensitive error:&error];
    
    return [regex numberOfMatchesInString:self options:0 range:NSMakeRange(0, self.length)];
}

- (BOOL)isValidPhone
{
    const char *cvalue = [self UTF8String];
    int len = strlen(cvalue);
    if (len != 11) {
        return FALSE;
    }
    if (![self isValidNumber:self]){
        return FALSE;
    }
    NSString *preString = [[NSString stringWithFormat:@"%@",self] substringToIndex:2];
    if ([preString isEqualToString:@"13"] ||
        [preString isEqualToString: @"15"] ||
        [preString isEqualToString: @"18"]){
        return TRUE;
    }
    else{
        return FALSE;
    }
    return TRUE;
}

- (BOOL) isValidNumber:(NSString*)value{
    const char *cvalue = [value UTF8String];
    int len = strlen(cvalue);
    for (int i = 0; i < len; i++) {
        if(!isNumber(cvalue[i])){
            return FALSE;
        }
    }
    return TRUE;
}

- (NSUInteger)unsignedIntValue
{
    return [self integerValue];
}

@end
