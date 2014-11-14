//
//  WBaseModel.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-23.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WBaseModel.h"

NSString *const kREFRESH_DATA = @"refresh_data";

@interface WBaseModel (){
    NSMutableArray *delegates;
}
@end

@implementation WBaseModel

-(id)initWithAVObject:(AVObject *)data{
    self = [super init];
    self.data = data;
    delegates = [[NSMutableArray alloc]init];
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
    for (id<DataDelegate> delegate in delegates) {
        [delegate onDataChange:key valueWith:value oldValueWith:old];
    }
}

-(void) registerDataChange:(id<DataDelegate> *)delegate{
    [delegates addObject:delegate];
}

-(void) unregisterDataChange:(id<DataDelegate> *)delegate{
    [delegates removeObject:delegate];
}

@end
