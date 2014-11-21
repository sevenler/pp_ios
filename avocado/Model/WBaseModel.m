//
//  WBaseModel.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-23.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WBaseModel.h"

NSString *const kREFRESH_DATA = @"refresh_data";//刷新数据，调用refresh刷新数据后，会使用这个值来notify数据
NSString *const kDATA_CHANGE_SIGN_IN = @"dc_sign_in";//登陆
NSString *const kDATA_CHANGE_SIGN_OUT = @"dc_sign_out";//退出登陆

@interface WBaseModel (){
    NSMutableArray *observers;
}
@end

@implementation WBaseModel

-(id)init{
    self = [super init];
    observers = [[NSMutableArray alloc]init];
    return self;
}

-(id)initWithAVObject:(AVObject *)data{
    self = [self init];
    self.data = data;
    return self;
}

- (NSString *) getRemoteId{
    return self.data.objectId;
}

-(void) refresh{
    [self.data refreshInBackgroundWithBlock:^(AVObject *object, NSError *error) {
        if (!error) {
            [self onDataChange:kREFRESH_DATA valueWith:nil oldValueWith:nil];
        } else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

- (NSString *) description{
    return @"";
}

-(void) onDataChange:(NSString *)key
           valueWith:(NSObject *)value
        oldValueWith:(NSObject *)old{
    for (id<DataDelegate> delegate in observers) {
        [delegate onDataChange:key valueWith:value oldValueWith:old];
    }
}

-(void) registerDataChange:(id<DataDelegate> *)delegate{
    [observers addObject:delegate];
}

-(void) unregisterDataChange:(id<DataDelegate> *)delegate{
    [observers removeObject:delegate];
}

@end
