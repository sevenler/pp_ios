//
//  WDetailViewController.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-23.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WDetailViewController.h"
#import "WTextPageViewController.h"
#import "WEventPreviewView.h"
#import "WConfig.h"
#import "WEventCenter.h"
#import "WEventModel.h"
#import "WEventViewController.h"
#import "WEventedTapGestureRecognizer.h"
#import "WUserPreviewView.h"
#import "WUserCenter.h"
#import "WUserModel.h"
#import "WUserViewController.h"
#import "UIImageView+WebCache.h"
#import "MASConstraintMaker.h"
#import "View+MASAdditions.h"

#define TAG_DISCRIPTION_MORE 1
#define TOP_EVENT_START  900
#define TOP_EVENT_HEIGHT  120

@interface WDetailViewController ()

@property (retain, nonatomic)  UIScrollView *scrollview;

@property (retain, nonatomic)  UIImageView *headerview;
@property (retain, nonatomic)  UIImageView *image0;
@property (retain, nonatomic)  UIImageView *image1;
@property (retain, nonatomic)  UILabel *titleview;
@property (retain, nonatomic)  UILabel *discriptionview;
@property (retain, nonatomic)  FlatPillButton *discriptionMoreView;
@property (retain, nonatomic)  UILabel *eventTitle;

@end

@implementation WDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.scrollview setContentSize:CGSizeMake(320, 1800)];
}


//初始化页面样式
- (void)viewInitStyle
{
    _scrollview = [[UIScrollView alloc] init];
    [_scrollview setBackgroundColor:[WConfig hexStringToColor:@"#e2e2e2"]];
    
    _headerview = [[UIImageView alloc] init];
    _titleview = [[UILabel alloc] init];
    _discriptionview = [[UILabel alloc] init];
    _discriptionMoreView = [[FlatPillButton alloc] init];
    _image0 = [[UIImageView alloc] init];
    _image1 = [[UIImageView alloc] init];
    
    [self.view addSubview:_scrollview];
    [_scrollview addSubview:_headerview];
    [_scrollview addSubview:_titleview];
    [_scrollview addSubview:_discriptionview];
    [_scrollview addSubview:_discriptionMoreView];
    [_scrollview addSubview:_image0];
    [_scrollview addSubview:_image1];
    
    UIView *superview = _scrollview;
    UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
    NSInteger imageHeight = 200;
    NSInteger screenWidth = 320;
    [_scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.view);
        make.width.equalTo(@(screenWidth));
    }];
    [_headerview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview);
        make.width.equalTo(@(screenWidth));
        make.height.equalTo(@(imageHeight));
    }];
    [_titleview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headerview.mas_bottom);
        make.width.equalTo(@(screenWidth));
        make.height.equalTo(@(30));
    }];
    [_discriptionview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleview.mas_bottom).insets(padding);
//        make.left.equalTo(superview).insets(padding);
//        make.right.equalTo(superview).insets(padding);
        make.width.equalTo(@(screenWidth)).insets(padding);
        make.height.equalTo(@(100));
    }];
    
    //创建一个宽满屏的view，按钮借用此view来完成居中
    UIView *view = [[UIView alloc] init];
    [_scrollview addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_discriptionview.mas_bottom).insets(padding);
        make.width.equalTo(@(screenWidth)).insets(padding);
        make.height.equalTo(@(30)).insets(padding);
    }];
    [_discriptionMoreView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(view).insets(padding);
        make.width.equalTo(@(100)).insets(padding);
        make.height.equalTo(@(30)).insets(padding);
    }];
    
    [_image0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_discriptionMoreView.mas_bottom).insets(padding);
        make.width.equalTo(@(screenWidth)).insets(padding);
        make.height.equalTo(@(imageHeight)).insets(padding);
    }];
    [_image1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_image0.mas_bottom).insets(padding);
        make.width.equalTo(@(screenWidth)).insets(padding);
        make.height.equalTo(@(imageHeight)).insets(padding);
    }];
    
    //修改样式
    [WConfig setLabelWithBigTitleStyle: self.titleview];
    [WConfig setLabelWithDescriptionStyle: self.discriptionview];
    self.discriptionview.numberOfLines = 7;
    [WConfig setButtonWithDefaultStyle: self.discriptionMoreView];
    [WConfig setLabelWithNormalTitleStyle: self.eventTitle];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self viewInitStyle];
    
    self.discriptionview.text = [NSString stringWithFormat:@"%@", [self.projectModel getDescription]];
    self.titleview.text = [NSString stringWithFormat:@"%@", [self.projectModel getTitle]];
    self.discriptionMoreView.tag = TAG_DISCRIPTION_MORE;
    [self.discriptionMoreView setTitle:@"更多" forState:UIControlStateNormal];
    [self.discriptionMoreView addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    NSMutableArray *images = [self.projectModel getImages];
    
    [self.headerview setImageWithURL:[NSURL URLWithString:images[0]]];
    [self.image0 setImageWithURL:[NSURL URLWithString:images[1]]];
    [self.image1 setImageWithURL:[NSURL URLWithString:images[2]]];
    
    self.eventTitle.text = @"可预订的活动";
    //添加活动列表，并适配
    [[WEventCenter instance] getAllEvent:[self.projectModel getRemoteId]
                               blockWith:^(NSArray *objects, NSError *error) {
                                   if (!error) {
                                       NSInteger index = 0;
                                       for(AVObject *obj in objects)
                                       {
                                           WEventModel *event = [[WEventModel alloc]initWithAVObject:obj];
                                           [self initEventView: self.scrollview indexWith:index++ dataWith:event];
                                       }
                                       
                                    
                                       //请求用户信息，并适配
                                       //在请求活动信息完成后，在开始请求用户信息。
                                       //因为用户的view适配需要知道活动的item数量，才能计算view的top位置
                                       [[WUserCenter instance] getUser:[self.projectModel getOwner]
                                                             blockWith:^(NSArray *objects, NSError *error) {
                                                                 if (!error) {
                                                                     NSInteger count = (objects.count > 1 ? 1 : objects.count);
                                                                     for (int i = 0; i < count; i++) {
                                                                         WUserModel *user = [[WUserModel alloc]initWithAVObject:objects[i]];
                                                                         NSLog(@"get user: %@", [user getNick]);
                                                                         
                                                                         //计算用户模块的x坐标
                                                                         NSInteger top = TOP_EVENT_START + TOP_EVENT_HEIGHT * index;
                                                                         [self initUserView:self.scrollview topWith:top userWith:user];
                                                                     }
                                                                 } else {
                                                                     NSLog(@"Error: %@ %@", error, [error userInfo]);
                                                                 }
                                                             }];
                                   } else {
                                       NSLog(@"Error: %@ %@", error, [error userInfo]);
                                   }
                               }];
}

//初始化活动项目
- (void)initEventView:(UIScrollView *)parent
            indexWith:(NSInteger) index
             dataWith:(WEventModel *)event
{
    NSInteger top = TOP_EVENT_START;
    NSInteger height = TOP_EVENT_HEIGHT;
    WEventPreviewView *item = [[WEventPreviewView alloc] init];
    [item setFrame: CGRectMake(0, top + index * height, 320, height)];
    [item setData:[event getImages][0] titleWith:[event getTitle] priceWith:[event getPrice]];
    [self setTapRecognizer:item dataWith:event tagWith:1];
    
    [parent addSubview:item];
}

//初始化用户模块
-(void)initUserView:(UIScrollView *)parent
            topWith:(NSInteger) top
           userWith:(WUserModel *) user
{
    NSInteger height = 250;
    WUserPreviewView *view = [[WUserPreviewView alloc] init];
    [view setFrame: CGRectMake(0, top, 320, height)];
    [view setData:user];
    [parent addSubview:view];
    
    [self setTapRecognizer:view dataWith:user tagWith:2];
}

//区域点击事件
- (void)handleTap:(WEventedTapGestureRecognizer *)recognizer {
    switch (recognizer.redirectTag) {
        case 1:{
            WEventViewController *detail = [[WEventViewController alloc] init];
            detail.eventModel = recognizer.data;
            [self.navigationController pushViewController:detail animated:YES];
        }
            break;
        case 2:{
            [self openUser:recognizer.data isSelf:false navigationWith:self.navigationController];
        }
            break;
        default:
            break;
    }
}

//按钮点击事件
- (IBAction)buttonPress:(id)sender {
    UIView *view = sender;
    
    switch (view.tag) {
        case TAG_DISCRIPTION_MORE:{
            WTextPageViewController *textpage = [[WTextPageViewController alloc] init];
            textpage.showText = [self.projectModel getDescription];
            [self.navigationController pushViewController:textpage animated:YES];
        }
            break;
        default:
            break;
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
