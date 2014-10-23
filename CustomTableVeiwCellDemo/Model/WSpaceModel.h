//
//  WPaperModel.h
//  CustomTableVeiwCellDemo
//
//  Created by wzrong on 13-8-15.
//
//  

#import <Foundation/Foundation.h>
#import "WBaseModel.h"

@interface WSpaceModel : WBaseModel


- (NSMutableArray *) getImages;
- (NSString *) getTitle;
- (NSString *) getDescription;
- (NSInteger) getLeftDays;
- (NSInteger) getParters;
- (NSInteger) getLikers;
- (NSString *) getAvater;
- (NSString *) getPosition;
- (NSString *) getPositionUnit;


@end
