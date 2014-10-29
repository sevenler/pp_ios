//
//  WUtils.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-29.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WUtils.h"

@implementation WUtils

+ (NSString *)formatDate:(NSDate *)date
              withFromat:(NSString *)format;
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
//    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"..."]];
    
    NSString *value = [formatter stringFromDate:date];
    [formatter release];
    
    return value;
}

@end
