//
//  WConfig.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-22.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WConfig.h"
#import "FlatPillButton.h"

#define COLOR_BLACK @"#636769"
#define COLOR_GRAY @"#89939F"
#define COLOR_GREEN @"#6DC59A"

#define FONT_SIZE_BIG 18
#define FONT_SIZE_SMALL 12

@implementation WConfig

+(UIColor *) hexStringToColor: (NSString *) stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    
    if ([cString length] < 6) return [UIColor blackColor];
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    
    // Separate into r, g, b substring
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

+ (void)setLabelWithTitleStyle:(UILabel *)lbl{
    lbl.textColor = [WConfig hexStringToColor: COLOR_BLACK];
    [lbl setFont:[UIFont systemFontOfSize:FONT_SIZE_BIG]];
}

+ (void)setLabelWithDescriptionStyle:(UILabel *)lbl{
     lbl.textColor = [WConfig hexStringToColor: COLOR_GRAY];
    [lbl setFont:[UIFont systemFontOfSize:FONT_SIZE_SMALL]];
}

+ (void)setButtonWithDefaultStyle:(FlatPillButton *)button{
    [button setTitleColor:[WConfig hexStringToColor: COLOR_GREEN] forState:UIControlStateNormal];
}

@end
