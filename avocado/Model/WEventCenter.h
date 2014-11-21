//
//  WProjectCenter.h
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-9-21.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WEventCenter : NSObject
+(WEventCenter *) instance;
- (void)getAllEvent:(NSString *)spaceId
          blockWith:(void(^)(NSArray *objects, NSError *error))block;
@end