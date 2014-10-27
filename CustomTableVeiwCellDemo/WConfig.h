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
+(UIColor *) hexStringToColor: (NSString *) stringToConvert;

+ (void)setLabelWithBigTitleStyle:(UILabel *)lbl;

+ (void)setLabelWithNormalTitleStyle:(UILabel *)lbl;

+ (void)setLabelWithDescriptionStyle:(UILabel *)lbl;

+ (void)setButtonWithDefaultStyle:(FlatPillButton *)button;

@end
