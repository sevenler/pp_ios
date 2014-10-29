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
    [WConfig setLabelWithBigTitleStyle: self.lblTitle];
    [WConfig setLabelWithDescriptionStyle: self.lblDescription];
    self.lblTitle.textAlignment = UITextAlignmentLeft;
    
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
-(void)setupCell:(WSpaceModel *)model{
    NSMutableArray *images = [model getImages];
    
    self.lblTitle.text  = [model getTitle];
    self.lblDescription.text  = [NSString stringWithFormat:@"%@ . %d人收藏", [model getPositionUnit], [model getLikers]];
    self.imgThumb.imageURL = [NSURL URLWithString:[model getImages][0]];
    self.imgAvater.imageURL = [NSURL URLWithString:[model getOwnerAvater]];
    
    CALayer *l = [self.imgAvater layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:32.0];
    NSLog(@"  =============  downloadImage  %@ %@ ============ ", images[0], [model getOwnerAvater]);
}

@end

