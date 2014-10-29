//
//  WConfig.h
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-22.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlatPillButton.h"

@interface WConfig : NSObject

#define COLOR_BLACK @"#636769"
#define COLOR_GRAY @"#89939F"
#define COLOR_GREEN @"#6DC59A"

+(UIColor *) hexStringToColor: (NSString *) stringToConvert;

+ (void)setLabelWithBigTitleStyle:(UILabel *)lbl;

+ (void)setLabelWithNormalTitleStyle:(UILabel *)lbl;

+ (void)setLabelWithDescriptionStyle:(UILabel *)lbl;

+ (void)setButtonWithDefaultStyle:(FlatPillButton *)button;

+ (void)setSpinerLineStyle:(UIView *)line;

@end
