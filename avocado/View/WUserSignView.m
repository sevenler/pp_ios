//
//  WUserSignView.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-11-7.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WUserSignView.h"
#import "WConfig.h"
#import "MASConstraintMaker.h"
#import "View+MASAdditions.h"
#import "UIImageView+WebCache.h"

@interface WUserSignView ()

@property (strong, nonatomic) UIImageView *imageview;
@property (strong, nonatomic) UILabel *title;

@end

@implementation WUserSignView

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    self.imageview = [[UIImageView alloc] init];
    self.title = UILabel.new;
    [self addSubview:self.imageview];
    [self addSubview:self.title];
    
    [WConfig setLabelWithNormalTitleStyle: self.title];
    
    UIView *superview = self;
    UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
    
    //使用view来作为父控件，imageview在其中居中
    NSInteger height = 80;
    [self.imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(superview);
        make.height.width.equalTo(@(height));
    }];
    //头像圆角
    CALayer *l = [self.imageview layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:height / 2];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageview.mas_bottom).insets(padding);
        make.left.right.equalTo(superview).insets(padding);
        make.height.equalTo(@(30));
    }];
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) setData:(WUserModel *)user{
    [self.imageview setImageWithURL:[NSURL URLWithString:[user getAvater]]];
    self.title.text = [NSString stringWithFormat:@"%@", [user getNick]];
}

@end
