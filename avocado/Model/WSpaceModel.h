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
- (NSString *) getPosition;
- (NSString *) getPositionUnit;
- (NSString *) getOwner;
- (NSString *) getOwnerAvater;
- (NSString *) getOwnerName;


@end
