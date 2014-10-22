//
//  WPaperModel.m
//  CustomTableVeiwCellDemo
//
//  Created by wzrong on 13-8-15.
//  Copyright (c) 2013年 wzrong. All rights reserved.
//
//  试卷模型
//

#import "WSpaceModel.h"

@implementation WProjectModel


- (id)initWithImage:(NSString *)image
              title:(NSString *)title
        description:(NSString *)description
           leftDays:(NSInteger)leftDays
            parters:(NSInteger)parters
             avater:(NSString *)avater{
    self = [super init];
    
    if (self) {
        self.image        = image;
        self.title      = title;
        self.description = description;
        self.leftDays  = leftDays;
        self.parters     = parters;
        self.avater        = avater;
    }
    
    return self;
}

@end
