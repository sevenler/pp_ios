//
//  WEventModel.h
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-27.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WBaseModel.h"

@interface WEventModel : WBaseModel

- (NSMutableArray *) getImages;
- (NSString *) getTitle;
- (NSString *) getDescription;
- (NSInteger) getPrice;
- (NSDate *) getTargetDate;
- (NSInteger) getPrice;
- (NSInteger) getTargetMax;
- (NSInteger) getPartners;

@end
