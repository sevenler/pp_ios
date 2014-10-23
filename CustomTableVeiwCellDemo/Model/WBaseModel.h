//
//  WBaseModel.h
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-23.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import <AVOSCloud/AVOSCloud.h>

@interface WBaseModel : AVObject

@property (strong, nonatomic) AVObject *data;

-(id)initWithAVObject:(AVObject *)data;

@end
