//
//  WPaperModel.h
//  CustomTableVeiwCellDemo
//
//  Created by wzrong on 13-8-15.
//
//  

#import <Foundation/Foundation.h>
#import "WBaseModel.h"

@interface WOrderModel : WBaseModel

- (NSInteger) getStatus;
- (NSString *) getSpaceId;
- (NSString *) getCustomer;

@end
