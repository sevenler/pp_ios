//
//  WPaperCell.m
//  CustomTableVeiwCellDemo
//
//  Created by wzrong on 13-8-15.
//  Copyright (c) 2013年 wzrong. All rights reserved.
//

#import "WProjectCell.h"
#import "WConfig.h"
#import <QuartzCore/QuartzCore.h>

@implementation WProjectCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    
    [WConfig setLabelWithTitleStyle: self.lblTitle];
    [WConfig setLabelWithDescriptionStyle: self.lblDescription];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

/**
 设置Cell
 */
-(void)setupCell:(WProjectModel *)model{
    self.lblTitle.text  = model.title;
    self.lblDescription.text  = [NSString stringWithFormat:@"%@ . %d人收藏", model.positionUnit, model.likers];
    self.imgThumb.imageURL = [NSURL URLWithString:model.image];
    self.imgAvater.imageURL = [NSURL URLWithString:model.avater];
    
    CALayer *l = [self.imgAvater layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:32.0];
    NSLog(@"  =============  downloadImage  %@ %@ ============ ", model.image, model.avater);
}

@end

