//
//  WProjectCenter.h
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-9-21.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WUserCenter : NSObject
+(WUserCenter *) instance;
- (void)getUser:(NSString *)userId
      blockWith:(void(^)(NSArray *objects, NSError *error))block;
@end