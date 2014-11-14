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

@interface WUserViewController ()

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
    [self.scrollview setContentSize:CGSizeMake(320, 800)];
}

//初始化页面样式
- (void)viewInitStyle
{
    //修改样式
    [WConfig setLabelWithBigTitleStyle: self.lb_nick_content];
    [WConfig setLabelWithDescriptionStyle: self.lb_position_content];
    [WConfig setLabelWithDescriptionStyle: self.lb_register_date_content];
    [WConfig setLabelWithDescriptionStyle: self.lb_description_name];
    [WConfig setLabelWithNormalTitleStyle: self.lb_description_content];
    
    self.lb_nick_content.textAlignment = UITextAlignmentLeft;
    self.lb_description_content.numberOfLines = 5;
    
    [self setTitleStyle: self.lb_work_name];
    [self setContentStyle: self.lb_work_content];
    [self setTitleStyle: self.lb_school_name];
    [self setContentStyle: self.lb_school_content];
    
    [WConfig setLabelWithBigTitleStyle: self.lb_verified_name];
}

- (void) setTitleStyle:(UILabel *)label
{
    [WConfig setLabelWithBigTitleStyle: label];
    label.textColor = [WConfig hexStringToColor:kCOLOR_GRAY];
    label.textAlignment = UITextAlignmentLeft;
}

- (void) setContentStyle:(UILabel *)label
{
    [WConfig setLabelWithBigTitleStyle: label];
    label.textAlignment = UITextAlignmentRight;
}

- (void)viewInitData
{
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
    for(int i = 0 ;i < verified.count;i++){
        if ([self.userModel getVerifiedValue:verified[i]]) {
            [self initVerifiedView:self.scrollview indexWith:i keyWith:verified[i]];
        }
    }
}

-(void) onDataChange:(NSString *)key
           valueWith:(NSObject *)value
        oldValueWith:(NSObject *)old{
    NSLog(@" onDataChange  %@ %@ %@", key, value, [self.userModel description]);
    
    if([kREFRESH_DATA isEqualToString:key]){
        [self viewInitData];
    }
}

- (void)initVerifiedView:(UIScrollView *)parent
            indexWith:(NSInteger) index
              keyWith:(NSString *)key
{
    NSInteger top = 550;
    NSInteger height = 50;
    WVerifiedView *item = [[WVerifiedView alloc] init];
    [item setFrame: CGRectMake(0, top + index * height, 320, height)];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
