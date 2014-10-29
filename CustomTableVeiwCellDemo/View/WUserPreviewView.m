//
//  WUserPreviewView.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-29.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WUserPreviewView.h"
#import "EGOImageView.h"
#import "WConfig.h"
#import "MASConstraintMaker.h"
#import "View+MASAdditions.h"

@interface WUserPreviewView()
@property (strong, nonatomic) EGOImageView *imageview;
@property (strong, nonatomic) UILabel *title;
@property (strong, nonatomic) UILabel *description;
@end

@implementation WUserPreviewView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    UIView *view = [[UIView alloc] init];
    self.imageview = [[EGOImageView alloc] init];
    self.title = UILabel.new;
    self.description = UILabel.new;
    [self addSubview:view];
    [self addSubview:self.title];
    [self addSubview:self.description];
    
    [WConfig setLabelWithDescriptionStyle: self.description];
    [WConfig setLabelWithNormalTitleStyle: self.title];
    self.description.textColor = [WConfig hexStringToColor: kCOLOR_BLACK];
    self.description.numberOfLines = 10;
    
    UIView *superview = self;
    UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
    
    //使用view来作为父控件，imageview在其中居中
    NSInteger height = 100;
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(superview).insets(padding);
        make.height.equalTo(@(height));
    }];
    [view addSubview:self.imageview];
    //注意：mas_makeConstraints方法必须在 addSubview后面调用。
    [self.imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(view);
        make.height.width.equalTo(@(height));
    }];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_bottom).insets(padding);
        make.left.and.right.equalTo(superview).insets(padding);
        
        make.height.width.equalTo(@(50));
    }];
    [self.description mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.title.mas_bottom).insets(padding);
        make.left.and.right.equalTo(superview).insets(padding);
        
        make.height.equalTo(@(150));
    }];
    
    
    return self;
}

-(void) setData:(NSString *)image
       nameWith:(NSString *)name
descriptionWith:(NSString *)description{
    self.imageview.imageURL  = [NSURL URLWithString: image];
    self.title.text = name;
    self.description.text = description;
}

@end
