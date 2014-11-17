//
//  WProjectCenter.h
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-9-21.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WProjectCenter : NSObject
+(WProjectCenter *) instance;
- (void)getAllSpace:(void(^)(NSArray *objects, NSError *error))block;
- (void)getAllSpace:(NSString *) user
          blockWith:(void(^)(NSArray *objects, NSError *error))block;
@end