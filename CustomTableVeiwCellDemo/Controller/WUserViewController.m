//
//  WUserViewController.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-30.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WUserViewController.h"
#import "WConfig.h"
#import "WUtils.h"
#import "WVerifiedView.h"
#import "WUserModel.h"
#import "UIImageView+WebCache.h"
#import "WBaseModel.h"
#import "MASConstraintMaker.h"
#import "View+MASAdditions.h"

#define VERIFIED_VIEW_HEIGHT  650

@interface WUserViewController ()

@property (retain, nonatomic)  UIScrollView *scrollview;
@property (retain, nonatomic)  UIImageView *image_avater;
@property (retain, nonatomic)  UILabel *lb_nick_content;
@property (retain, nonatomic)  UILabel *lb_position_content;
@property (retain, nonatomic)  UILabel *lb_register_date_content;
@property (retain, nonatomic)  UILabel *lb_description_name;
@property (retain, nonatomic)  UILabel *lb_description_content;

@property (retain, nonatomic)  UILabel *lb_work_name;
@property (retain, nonatomic)  UILabel *lb_work_content;
@property (retain, nonatomic)  UILabel *lb_school_name;
@property (retain, nonatomic)  UILabel *lb_school_content;

@property (retain, nonatomic)  UILabel *lb_verified_name;

@end

@implementation WUserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self resetScrollViewContent];
}

- (void)viewDidLayoutSubviews {
    //没有这句话，自动布局将导致在ios7下scrollview不能滚动。
    [self resetScrollViewContent];
}

- (void)resetScrollViewContent {
    [_scrollview setContentSize:CGSizeMake(320, 800)];
}

//初始化页面样式
- (void)viewInitStyle
{
    //创建view
    _scrollview = [[UIScrollView alloc] init];
    _scrollview.backgroundColor = [UIColor whiteColor];
    
    _image_avater = [[UIImageView alloc] init];
    _lb_nick_content = [[UILabel alloc] init];
    _lb_position_content = [[UILabel alloc] init];
    _lb_register_date_content = [[UILabel alloc] init];
    _lb_description_name = [[UILabel alloc] init];
    _lb_description_content = [[UILabel alloc] init];
    
    UIView *line0 = [[UIView alloc] init];
    UIView *line1 = [[UIView alloc] init];
    UIView *line2 = [[UIView alloc] init];
    _lb_work_name = [[UILabel alloc] init];
    _lb_work_content = [[UILabel alloc] init];
    _lb_school_name = [[UILabel alloc] init];
    _lb_school_content = [[UILabel alloc] init];
    
    _lb_verified_name = [[UILabel alloc] init];
    UIView *line3 = [[UIView alloc] init];
    
    [self.view addSubview:_scrollview];
    [_scrollview addSubview:_image_avater];
    [_scrollview addSubview:_lb_nick_content];
    [_scrollview addSubview:_lb_position_content];
    [_scrollview addSubview:_lb_register_date_content];
    [_scrollview addSubview:_lb_description_name];
    [_scrollview addSubview:_lb_description_content];
    
    [_scrollview addSubview:line0];
    [_scrollview addSubview:line1];
    [_scrollview addSubview:line2];
    [_scrollview addSubview:_lb_work_name];
    [_scrollview addSubview:_lb_work_content];
    [_scrollview addSubview:_lb_school_name];
    [_scrollview addSubview:_lb_school_content];
    
    [_scrollview addSubview:_lb_verified_name];
    [_scrollview addSubview:line3];

    
    UIView *superview = _scrollview;
    NSInteger paddingValue = 10;
    UIEdgeInsets padding = UIEdgeInsetsMake(0, paddingValue, 0, paddingValue);
    NSInteger imageHeight = 300;
    NSInteger screenWidth = 320;
    [_scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.right.bottom.equalTo(self.view);
    }];
    [_image_avater mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(superview);
        make.width.equalTo(@(screenWidth));
        make.height.equalTo(@(imageHeight));
    }];
    
    [_lb_nick_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superview).insets(padding);
        make.top.equalTo(_image_avater.mas_bottom);
        make.width.equalTo(@(screenWidth - paddingValue * 2));
        make.height.equalTo(@(30));
    }];
    [_lb_position_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superview).insets(padding);;
        make.top.equalTo(_lb_nick_content.mas_bottom);
        make.width.equalTo(@(screenWidth));
        make.height.equalTo(@(15));
    }];
    [_lb_register_date_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superview).insets(padding);;
        make.top.equalTo(_lb_position_content.mas_bottom);
        make.width.equalTo(@(screenWidth));
        make.height.equalTo(@(15));
    }];
    
    [_lb_description_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superview).insets(padding);
        make.top.equalTo(@(385));
        make.width.equalTo(@(screenWidth));
        make.height.equalTo(@(15));
    }];
    [_lb_description_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superview).insets(padding);
        make.top.equalTo(_lb_description_name.mas_bottom);
        make.width.equalTo(@(screenWidth - paddingValue * 2));
        make.height.equalTo(@(80));
    }];
    
    NSInteger nameWidth = 80;
    NSInteger contentHeight = 50;
    NSInteger top = 480;
    [line0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superview).insets(padding);
        make.top.equalTo(@(top + contentHeight * 0));
        make.width.equalTo(@(screenWidth - paddingValue * 2));
        make.height.equalTo(@(1));
    }];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superview).insets(padding);
        make.top.equalTo(@(top + contentHeight * 1));
        make.width.equalTo(@(screenWidth - paddingValue * 2));
        make.height.equalTo(@(1));
    }];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superview).insets(padding);
        make.top.equalTo(@(top + contentHeight * 2));
        make.width.equalTo(@(screenWidth - paddingValue * 2));
        make.height.equalTo(@(1));
    }];
    [_lb_work_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line0.mas_bottom);
        make.left.equalTo(superview).insets(padding);
        make.width.equalTo(@(nameWidth));
        make.height.equalTo(@(contentHeight));
    }];
    [_lb_work_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line0.mas_bottom);
        make.left.equalTo(_lb_work_name.mas_right).insets(padding);
        
        make.width.equalTo(@(screenWidth - nameWidth - paddingValue * 3));
        make.height.equalTo(@(contentHeight));
    }];
    [_lb_school_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom);
        make.left.equalTo(superview).insets(padding);
        make.width.equalTo(@(nameWidth));
        make.height.equalTo(@(contentHeight));
    }];
    [_lb_school_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom);
        make.left.equalTo(_lb_school_name.mas_right).insets(padding);
        
        make.width.equalTo(@(screenWidth - nameWidth - paddingValue * 3));
        make.height.equalTo(@(contentHeight));
    }];
    
    [_lb_verified_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(VERIFIED_VIEW_HEIGHT - 41));
        make.left.equalTo(superview).insets(padding);
        
        make.width.equalTo(@(screenWidth - paddingValue * 2));
        make.height.equalTo(@(40));
    }];
    [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superview).insets(padding);
        make.top.equalTo(_lb_verified_name.mas_bottom);
        make.width.equalTo(@(screenWidth - paddingValue * 2));
        make.height.equalTo(@(1));
    }];
    
    //修改样式
    [WConfig setLabelWithBigTitleStyle: self.lb_nick_content];
    [WConfig setLabelWithDescriptionStyle: self.lb_position_content];
    [WConfig setLabelWithDescriptionStyle: self.lb_register_date_content];
    [WConfig setLabelWithDescriptionStyle: self.lb_description_name];
    [WConfig setLabelWithNormalTitleStyle: self.lb_description_content];
    [WConfig setSpinerLineStyle:line0];
    [WConfig setSpinerLineStyle:line1];
    [WConfig setSpinerLineStyle:line2];
    [WConfig setSpinerLineStyle:line3];
    
    self.lb_nick_content.textAlignment = NSTextAlignmentLeft;
    self.lb_description_content.numberOfLines = 5;
    
    [self setTitleStyle: self.lb_work_name];
    [self setContentStyle: self.lb_work_content];
    [self setTitleStyle: self.lb_school_name];
    [self setContentStyle: self.lb_school_content];
    
    [WConfig setLabelWithBigTitleStyle: self.lb_verified_name];
}

-(void) addConfigItem{
    
}

- (void) setTitleStyle:(UILabel *)label
{
    [WConfig setLabelWithBigTitleStyle: label];
    label.textColor = [WConfig hexStringToColor:kCOLOR_GRAY];
    label.textAlignment = NSTextAlignmentLeft;
}

- (void) setContentStyle:(UILabel *)label
{
    [WConfig setLabelWithBigTitleStyle: label];
    label.textAlignment = NSTextAlignmentRight;
}

- (void)viewInitData
{
    NSLog(@" init data %@ ", [self.userModel description]);
    [self.image_avater setImageWithURL:[NSURL URLWithString:[self.userModel getAvater]]];
    
    self.lb_nick_content.text = [self.userModel getNick];
    self.lb_position_content.text = [self.userModel getPosition];
    self.lb_register_date_content.text = [WUtils formatDate:[self.userModel getRegisterDate] withFromat:@"yyyy-MM-dd"];
    self.lb_description_name.text = [NSString stringWithFormat:@"关于 %@", [self.userModel getNick]];
    self.lb_description_content.text = [self.userModel getDescription];
    [WUtils alignTop:self.lb_description_content];
    
    self.lb_work_name.text = @"工作";
    self.lb_work_content.text = [self.userModel getWork];
    self.lb_school_name.text = @"学校";
    self.lb_school_content.text = [self.userModel getSchool];
    
    //显示验证项
    self.lb_verified_name.text = @"已验证项";
    NSArray *verified = [NSArray arrayWithObjects:kVERIFIED_KEY_PHONE, kVERIFIED_KEY_EMAIL, kVERIFIED_KEY_IDENTITY_CARD, kVERIFIED_KEY_WEIBO, nil];
    NSInteger index = 0;
    for(int i = 0 ;i < verified.count;i++){
        if ([self.userModel getVerifiedValue:verified[i]]) {
            [self initVerifiedView:self.scrollview indexWith:index++ keyWith:verified[i]];
        }
    }
}

-(void) onDataChange:(NSString *)key
           valueWith:(NSObject *)value
        oldValueWith:(NSObject *)old{
    if([kREFRESH_DATA isEqualToString:key]){
        [self viewInitData];
    }
}

- (void)initVerifiedView:(UIScrollView *)parent
            indexWith:(NSInteger) index
              keyWith:(NSString *)key
{
    NSInteger top = VERIFIED_VIEW_HEIGHT;
    NSInteger height = 50;
    WVerifiedView *item = [[WVerifiedView alloc] init];
    [item setFrame: CGRectMake(10, top + index * height, 300, height)];
    [item setData:[WUserModel getVerifiedName:key] iconWith:[WUserModel getVerifiedResource:key]];
    
    [parent addSubview:item];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self viewInitStyle];
    [self viewInitData];
    
    [self.userModel registerDataChange:self];
    [self.userModel refresh];
}

-(void)viewDidUnload {
    [super viewDidUnload];
    
    [self.userModel unregisterDataChange:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
