//
//  WConfig.h
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-22.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlatPillButton.h"

extern NSString *const kCOLOR_RED;
extern NSString *const kCOLOR_BLACK;
extern NSString *const kCOLOR_GRAY;
extern NSString *const kCOLOR_GREEN;

@interface WConfig : NSObject

+(UIColor *) hexStringToColor: (NSString *) stringToConvert;

+ (void)setLabelWithBigTitleStyle:(UILabel *)lbl;

+ (void)setLabelWithNormalTitleStyle:(UILabel *)lbl;

+ (void)setLabelWithDescriptionStyle:(UILabel *)lbl;

+ (void)setButtonWithDefaultStyle:(FlatPillButton *)button;

+ (void)setSpinerLineStyle:(UIView *)line;

@end
