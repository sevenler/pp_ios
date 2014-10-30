//
//  WUtils.h
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-29.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WUtils : NSObject

+ (NSString *)formatDate:(NSDate *)date
              withFromat:(NSString *)format;

+ (void)alignTop:(UILabel *)label;

@end
