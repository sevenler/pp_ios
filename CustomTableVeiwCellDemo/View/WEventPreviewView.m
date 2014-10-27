//
//  MASExampleAttributeChainingView.m
//  Masonry iOS Examples
//
//  Created by Jonas Budelmann on 31/03/14.
//  Copyright (c) 2014 Jonas Budelmann. All rights reserved.
//

#import "WEventPreviewView.h"
#import "MASConstraintMaker.h"
#import "View+MASAdditions.h"
#import "EGOImageView.h"
#import "WConfig.h"

@interface WEventPreviewView()

@property (strong, nonatomic) EGOImageView *imageview;
@property (strong, nonatomic) UILabel *title;
@property (strong, nonatomic) UILabel *description;


@end

@implementation WEventPreviewView

- (id)init {
    self = [super init];
    if (!self) return nil;

    self.imageview = [[EGOImageView alloc] init];
    self.title = UILabel.new;
    self.description = UILabel.new;
    [self addSubview:self.imageview];
    [self addSubview:self.title];
    [self addSubview:self.description];
//    self.imageview.backgroundColor = UIColor.greenColor;
//    self.title.backgroundColor = UIColor.redColor;
//    self.description.backgroundColor = UIColor.blueColor;
    
    [WConfig setLabelWithDescriptionStyle: self.description];
    [WConfig setLabelWithNormalTitleStyle: self.title];
    self.title.textAlignment = UITextAlignmentLeft;
    self.description.textColor = UIColor.redColor;

    UIView *superview = self;
    UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);

    [self.imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.equalTo(superview).insets(padding);
        make.bottom.equalTo(superview).insets(padding);
        
        make.width.equalTo(@(130));
    }];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.right.equalTo(superview).insets(padding);
        make.left.equalTo(self.imageview.mas_right).insets(padding);
        make.bottom.equalTo(self.description.mas_top).insets(padding);
    }];
    [self.description mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.title.mas_bottom).insets(padding);
        make.left.equalTo(self.imageview.mas_right).insets(padding);
        make.right.and.bottom.equalTo(superview).insets(padding);
        
        make.height.equalTo(@(20));
    }];
    
    //添加分割线
    UIView *line = UIView.new;
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(superview);
        make.height.equalTo(@(1));
    }];
    [WConfig setSpinerLineStyle: line];
    

    return self;
}

-(void) setData:(NSString *)image
      titleWith:(NSString *)title
priceWith:(float)price{
    self.imageview.imageURL  = [NSURL URLWithString: image];
    self.title.text = title;
    self.description.text = [NSString stringWithFormat:@"%f 人/位", price];
}


@end
