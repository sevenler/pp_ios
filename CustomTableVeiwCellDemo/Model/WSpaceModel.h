//
//  WPaperModel.h
//  CustomTableVeiwCellDemo
//
//  Created by wzrong on 13-8-15.
//
//  

#import <Foundation/Foundation.h>

@interface WProjectModel : NSObject

@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *description;

@property (nonatomic, assign) NSInteger leftDays;
@property (nonatomic, assign) NSInteger parters;
@property (nonatomic, strong) NSString *avater;

@property (nonatomic, strong) NSString *position;
@property (nonatomic, strong) NSString *positionUnit;
@property (nonatomic, assign) NSInteger likers;


- (id)initWithImage:(NSString *)image
              title:(NSString *)title
            description:(NSString *)description
           leftDays:(NSInteger)leftDays
            parters:(NSInteger)parters
             avater:(NSString *)avater;

@end
