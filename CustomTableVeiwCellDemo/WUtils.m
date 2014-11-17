//
//  WUtils.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-10-29.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WUtils.h"

@implementation WUtils

+ (NSString *)formatDate:(NSDate *)date
              withFromat:(NSString *)format;
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
//    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"..."]];
    
    NSString *value = [formatter stringFromDate:date];
    [formatter release];
    
    return value;
}

+ (void)alignTop:(UILabel *)label {
    CGSize fontSize = [label.text sizeWithFont:label.font];
    double finalHeight = fontSize.height * label.numberOfLines;
    double finalWidth = label.frame.size.width;    //expected width of label
    CGSize theStringSize = [label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(finalWidth, finalHeight) lineBreakMode:label.lineBreakMode];
    int newLinesToPad = (finalHeight  - theStringSize.height) / fontSize.height;
    for(int i=0; i<newLinesToPad; i++)
        label.text = [label.text stringByAppendingString:@"\n "];
}

+(WAppDelegate *)sharedAppdelegate
{
    return (WAppDelegate *)[[UIApplication sharedApplication] delegate];
}

@end
