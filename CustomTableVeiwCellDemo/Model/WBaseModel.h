//
//  WBaseModel.h
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-23.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import <AVOSCloud/AVOSCloud.h>

extern NSString *const kREFRESH_DATA;

@protocol DataDelegate
-(void) onDataChange:(NSString *)key
           valueWith:(NSObject *)value
        oldValueWith:(NSObject *)old;
@end

@interface WBaseModel : AVObject

@property (strong, nonatomic) AVObject *data;

-(id)initWithAVObject:(AVObject *)data;
- (NSString *) getRemoteId;
- (NSString *) description;


-(void) registerDataChange:(id<DataDelegate> *)delegate;
-(void) unregisterDataChange:(id<DataDelegate> *)delegate;


@end
