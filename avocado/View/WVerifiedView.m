//
//  WVerifiedViewController.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-30.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WVerifiedView.h"
#import "MASConstraintMaker.h"
#import "View+MASAdditions.h"
#import "WConfig.h"

@interface WVerifiedView()
@property (strong, nonatomic) UILabel *name;
@property (strong, nonatomic) UIImageView *content;
@end

@implementation WVerifiedView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubView];
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        [self initSubView];
    }
    return self;
}

-(void)initSubView{
    self.name = UILabel.new;
    self.content = UIImageView.new;
    [self addSubview:self.name];
    [self addSubview:self.content];
    
    [WConfig setLabelWithBigTitleStyle: self.name];
    self.name.textAlignment = NSTextAlignmentLeft;
    
    UIView *superview = self;
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.equalTo(superview);
        make.width.equalTo(@(80));
    }];
    UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(superview).insets(padding);
        make.width.equalTo(@(35));
    }];
    
    //添加分割线
    UIView *line = UIView.new;
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(superview);
        make.height.equalTo(@(1));
    }];
    [WConfig setSpinerLineStyle: line];
}

-(void) setData:(NSString *)title
       iconWith:(NSString *)icon{
    self.name.text = title;
    if(icon) [self.content setImage: [UIImage imageNamed:icon]];
}

@end
