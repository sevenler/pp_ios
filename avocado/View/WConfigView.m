//
//  WVerifiedViewController.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-30.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WConfigView.h"
#import "MASConstraintMaker.h"
#import "View+MASAdditions.h"
#import "WConfig.h"

@interface WConfigView()
@property (strong, nonatomic) UILabel *name;
@property (strong, nonatomic) UILabel *content;
@end

@implementation WConfigView

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
    self.content = UILabel.new;
    [self addSubview:self.name];
    [self addSubview:self.content];
    
    UIView *superview = self;
    NSInteger titleWidth = 80;
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.equalTo(superview);
        make.width.equalTo(@(titleWidth));
    }];
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(superview);
        make.width.equalTo(@(kSCREEN_WIDTH - titleWidth));
    }];
    
    //添加分割线
    UIView *line = UIView.new;
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(superview);
        make.height.equalTo(@(1));
    }];
    
    [WConfig setLabelWithBigTitleStyle: self.name];
    self.name.textAlignment = NSTextAlignmentLeft;
    self.name.textColor = [WConfig hexStringToColor:kCOLOR_GRAY];
    [WConfig setLabelWithBigTitleStyle:self.content];
    self.content.textAlignment = NSTextAlignmentRight;
    [WConfig setSpinerLineStyle: line];
}

-(void) setData:(NSString *)title
      valueWith:(NSString *)value{
    self.name.text = title;
    if(value) [self.content setText:value];
}

@end
